package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	public class Cursor extends Sprite
	{
		public function Cursor()
		{
			var g:Graphics = this.graphics;
			g.lineStyle(5,0xFFFFFF,0.5);
			g.drawCircle(0,0,5);
			g.lineStyle(1,0xFFFFFF,0.5);
			g.moveTo(0,-10); g.lineTo(0,10);
			g.moveTo(-10,0); g.lineTo(10,0);
		}
	}
}