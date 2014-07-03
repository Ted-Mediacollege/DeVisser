package guis 
{
	public class GuiArtSliding extends GuiArt
	{
		public var speedX:Number;
		public var speedY:Number;
		
		public function GuiArtSliding(a:MovieClip, px:Number, py:Number, sx:Number, sy:Number) 
		{
			super(a, px, py, 1, 1);
			
			speedX = sx;
			speedY = sy;
		}
		
		override public function tick():void
		{
			x += speedX;
			y += speedY;
		}
	}
}