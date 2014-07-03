package guis 
{
	import flash.display.MovieClip;
	
	public class GuiButtonSelect extends GuiButton
	{
		public var cframe:int;
		public var mframe:int;
		
		public function GuiButtonSelect(i:int, a:MovieClip, px:Number, py:Number, dx1:Number, dy1:Number, dx2:Number, dy2:Number, f:int) 
		{
			super(i, a, px, py, dx1, dy1, dx2, dy2);
			cframe = 0;
			mframe = f;
			art.gotoAndStop(1);
		}
		
		override public function setHover(h:Boolean):void
		{
		}
		
		override public function setEnabled(e:Boolean):void
		{
		}
		
		public function setFrame(f:int):void
		{
			art.gotoAndStop(f);
		}
	}
}