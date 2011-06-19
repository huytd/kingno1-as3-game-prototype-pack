package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Cannon extends Sprite
	{
		
		public function Cannon()
		{
			var g:Graphics = this.graphics;
			g.lineStyle(3,0xFFFFFF);
			g.drawCircle(0,0,10);
			g.moveTo(-5,0);
			g.lineTo(-20,-1);
		}
	}
}