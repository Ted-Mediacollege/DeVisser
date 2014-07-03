package guis 
{
	import flash.display.MovieClip;
	
	public class GuiArt extends MovieClip
	{
		public var art:MovieClip;
		public var baseX:Number;
		public var baseY:Number;
		
		public function GuiArt(a:MovieClip, px:Number, py:Number, sx:Number, sy:Number) 
		{
			art = a;
			x = px;
			y = py;
			baseX = px;
			baseY = py;
			scaleX = sx;
			scaleY = sy;
			addChild(art);
			art.gotoAndStop(1);
		}
		
		public function tick():void
		{
			
		}
		
		public function setArt(a:MovieClip):void
		{
			removeChild(art);
			art = a;
			addChild(art);
		}
		
		public function setFrame(f:int):void
		{
			art.gotoAndStop(f);
		}
	}
}