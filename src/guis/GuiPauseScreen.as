package guis 
{
	import flash.display.MovieClip;
	import flash.display.Graphics;
	
	public class GuiPauseScreen extends MovieClip
	{
		public function GuiPauseScreen() 
		{
		}
		
		public function draw(enabled:Boolean):void
		{
			graphics.clear();
			if (enabled)
			{
				graphics.beginFill(0x000000, 0.6);
				graphics.drawRect(0, 0, 1280, 900);
				graphics.endFill();
			}
		}
	}
}