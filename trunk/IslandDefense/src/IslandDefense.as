package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	[SWF(width=400,height=300,backgroundColor=0x4499FF)]
	public class IslandDefense extends Sprite
	{
		public static var c:Cannon;
		public var cur:Cursor;
		public var status:TextField;
		public static var bullets:Array = new Array();
		public static var currentBullet:Number;
		
		public function IslandDefense()
		{
			c = new Cannon();
			c.x = 200; c.y = 150;
			addChild(c);
			Mouse.hide();
			
			cur = new Cursor();
			addChild(cur);
			
			// Bang dan co 30 vien
			for (var i:Number = 0; i < 30; i++)
			{
				bullets[i] = new Bullet();
				bullets[i].x = c.x; bullets[i].y = c.y;
				addChild(bullets[i]);
			}
			
			for (var j:int = 0; j < 200; j+= 5)
			{
				if (j % 2 == 0)
				{
					for (var x:int = -200; x <= 200; x+=30)
					{
						for (var y:int = -150; y<=150; y+=30)
						{
							if ((Math.sqrt(x*x+y*y) >= 200) && (Math.sqrt(x*x+y*y) <= 205))
							{
								var e:Enemy = new Enemy();
								e.x = x + c.x; e.y = y + c.y;
								addChild(e);
								var e2:Enemy = new Enemy();
								e2.x = y + c.x; e2.y = x + c.y;
								addChild(e2);
							}
						}
					}
				}
			}
			
			currentBullet = 0;
			
			status = new TextField();
			status.textColor = 0xFFFFFF;
			status.autoSize = TextFieldAutoSize.LEFT;
			status.text = "Current bullet: " + currentBullet;
			addChild(status);
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouse_move);
			stage.addEventListener(MouseEvent.CLICK, mouse_click);
		}
		
		public function mouse_move(e:MouseEvent):void
		{
			var tx:Number = c.x - e.stageX;
			var ty:Number = c.y - e.stageY;
			var rot:Number = Math.atan2(ty,tx);
			c.rotation = 360 *(rot / (2*Math.PI));
			cur.x = e.stageX; cur.y = e.stageY;
		}
		
		public function mouse_click(e:MouseEvent):void
		{
			bullets[currentBullet].Shoot(new Point(e.stageX, e.stageY));
			currentBullet++;
			if (currentBullet >= 30) currentBullet = 0;
			status.text = "Current bullet: " + currentBullet;
		}
		
	}
}