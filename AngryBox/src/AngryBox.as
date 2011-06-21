package
{
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.osmf.layout.ScaleMode;

	[SWF(width=1024, height=600, backgroundColor=0x4499FF)]
	public class AngryBox extends Sprite
	{
		public var gun:Gun;
				
		public function AngryBox()
		{
			gun = new Gun();
			gun.x = 50;
			gun.y = 500;
			addChild(gun);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouse_move);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouse_up);
		}
		
		public function mouse_up(e:MouseEvent):void
		{
			gun.getShotData();
			gun.drawTail(0);
			gun.mdown = false;
			trace(gun.shotAngle + " - " + gun.shotPower);
			this.graphics.clear();
			drawBulletLine();
		}
		
		public function drawBulletLine():void
		{
			this.graphics.moveTo(gun.x + 15, gun.y + 15);
			var alpha:Number = gun.shotAngle * (2*Math.PI) / 360;
			var v0:Number = gun.shotPower;
			var x:Number, y:Number = 1, t:Number = 0;
			while (y < (gun.y + gun.height))
			{
				t++;
				x = v0*Math.cos(alpha)*t + gun.x + 15;
				y = - (v0*Math.sin(alpha)*t - 5*(t*t)) + gun.y + 15;
				this.graphics.lineStyle(1,0xFFFFFF, 0.5);
				this.graphics.lineTo(x,y);
				this.graphics.moveTo(x,y);
				this.graphics.lineStyle(2,0xFFFFFF);
				this.graphics.drawCircle(x,y,3);
			}
		}

		public function mouse_move(e:MouseEvent):void
		{
			if (gun.mdown == true)
				gun.rotateTail(new Point(e.stageX, e.stageY));
		}
	}
}