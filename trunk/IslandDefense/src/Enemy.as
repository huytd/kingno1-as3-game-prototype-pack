package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Enemy extends Sprite
	{
		public var Target:Point = new Point();
		public var g:Graphics;
		public var rotAngle:Number;
		public function Enemy()
		{
			g = this.graphics;
			g.lineStyle(3,0xFFFFFF);
			g.moveTo(0,0); g.lineTo(10, 0);
			g.moveTo(0,10); g.lineTo(10, 10);
			g.moveTo(0,0); g.lineTo(-10, 5);
			g.moveTo(0,10); g.lineTo(-10, 5);
			g.moveTo(10,0); g.lineTo(20, 5);
			g.moveTo(10,10); g.lineTo(20, 5);
			g.lineStyle(3,0xFF0000);
			g.drawCircle(5,5,3);
		
			Target.x = IslandDefense.c.x;
			Target.y = IslandDefense.c.y;
			this.rotation = 45;
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void
		{
			var dx:Number = Target.x - this.x;
			var dy:Number = Target.y - this.y;
			var angl:Number = Math.atan2(dy, dx);
			rotAngle = 360 *(angl / (2*Math.PI));
			this.x += Math.cos(angl) * 0.5;
			this.y += Math.sin(angl) * 0.5;
			if (Point.distance(Target, new Point(this.x, this.y)) <= 20)
			{
				this.removeEventListener(Event.ENTER_FRAME, update);
				this.visible = false;
			}
			
			this.rotation += (rotAngle - this.rotation) / 20;
		}
	}
}