package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Gun extends Sprite
	{
		public var graph:Graphics;
		
		public var bodyPart:Sprite;
		public var tailPart:Sprite;
		
		public var mdown:Boolean;
		public var dist:Number;
		
		public var shotAngle:Number;
		public var shotPower:Number;
		
		public function drawBody():void
		{
			var g:Graphics = bodyPart.graphics;
			g.lineStyle(5, 0xFFFFFF);
			g.beginFill(0xFFFFFF, 0.2);
			g.drawRect(0,0,30,80);
			g.endFill();
			g.drawCircle(15,15,5);
		}
		
		public function drawTail(distance:Number):void
		{
			var g:Graphics = tailPart.graphics;
			g.clear();
			g.lineStyle(5, 0xFFFFFF, 0.5);
			g.drawRect(0, -10, -distance, 20);
			g.moveTo(0,0); g.lineTo(60,0);
		}
		
		public function Gun()
		{
			mdown = false;
			bodyPart = new Sprite(); drawBody(); this.addChild(bodyPart);
			tailPart = new Sprite(); 
			drawTail(0); 
			tailPart.x = 15; tailPart.y = 15;
			this.addChild(tailPart);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouse_down);
		}
		
		public function mouse_down(e:MouseEvent):void
		{
			mdown = true;
		}
				
		public function getShotData():void
		{
			shotAngle = -Math.floor(tailPart.rotation);
			shotPower = Math.floor((this.dist / 60) * 100);
		}
		
		public function rotateTail(e:Point):void
		{
			var tx:Number = (tailPart.x + this.x) - e.x;
			var ty:Number = (tailPart.y + this.y) - e.y;
			var rot:Number = Math.atan2(ty,tx);
			var rotAngle:Number = 360 *(rot / (2*Math.PI));
			if ((Math.floor(rotAngle) < 55) && (Math.floor(rotAngle) > -55))
			{
				tailPart.rotation = rotAngle;
				dist = Point.distance(new Point(tailPart.x + this.x, tailPart.y + this.y), e);
				if (dist > 60) dist = 60;
				drawTail(dist); 
			}
		}

	}
}