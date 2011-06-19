package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Bullet extends Sprite
	{
		public var Target:Point;
		public var Avaiable:Boolean;
		
		public function Bullet()
		{
			var g:Graphics = this.graphics;
			g.lineStyle(3,0xFFFFFF);
			g.drawCircle(0,0,3);
			Avaiable = true;
		}
		
		public function Shoot(tar:Point):void
		{
			if (this.Avaiable)
			{
				Target = tar;
				this.Avaiable = false;
				this.addEventListener(Event.ENTER_FRAME, bullet_fly);
			}
		}
		
		public function bullet_fly(e:Event):void
		{
			var dx:Number = Target.x - this.x;
			var dy:Number = Target.y - this.y;
			var angl:Number = Math.atan2(dy, dx);
			this.x += Math.cos(angl) * 5;
			this.y += Math.sin(angl) * 5;
			if (Point.distance(Target, new Point(this.x, this.y)) <= 5)
			{
				this.scaleX += 0.5;
				this.scaleY += 0.5;
				if (this.scaleX > 5)
				{
					this.x = IslandDefense.c.x;
					this.y = IslandDefense.c.y;
					this.scaleX = 1; this.scaleY = 1;
					this.Avaiable = true;
					this.removeEventListener(Event.ENTER_FRAME, bullet_fly);
				}
			}
		}
	}
}