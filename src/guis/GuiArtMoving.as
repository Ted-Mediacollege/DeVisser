package guis 
{
	import flash.display.MovieClip;
	
	public class GuiArtMoving extends GuiArt
	{
		public var velX:Number;
		public var velY:Number;
		public var velP:Number;
		public var baseX:Number;
		public var baseY:Number;
		
		public function GuiArtMoving(a:MovieClip, px:Number, py:Number, vx:Number, vy:Number, vp:Number, bx:Number, by:Number) 
		{
			super(a, px, py, 1, 1);
			
			velX = vx;
			velY = vy;
			velP = vp;
			baseX = bx;
			baseY = by;
			
			addChild(art);
			art.gotoAndStop(1);
		}
		
		override public function tick():void
		{	
			if (x > baseX)
			{
				velX -= velP;
			}
			else
			{
				velX += velP;
			}
			
			if (y > baseY)
			{
				velY -= velP;
			}
			else
			{
				velY += velP;
			}
			
			x += velX;
			y += velY;
		}
	}
}