package guis 
{
	import flash.display.MovieClip;
	
	public class GuiButtonPress extends GuiButton
	{
		public function GuiButtonPress(i:int, a:MovieClip, px:Number, py:Number, dx1:Number, dy1:Number, dx2:Number, dy2:Number) 
		{
			super(i, a, px, py, dx1, dy1, dx2, dy2);
		}
		
		override public function setHover(h:Boolean):void
		{
		}
		
		override public function setEnabled(e:Boolean):void
		{
		}
		
		public function press(p:Boolean):void
		{
			if (p) { art.gotoAndStop(2); }
			else { art.gotoAndStop(1); }
		}
	}
}