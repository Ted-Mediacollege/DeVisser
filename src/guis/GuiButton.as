package guis 
{
	import flash.display.MovieClip;
	import sounds.SoundList;
	import sounds.SoundPlayer;
	
	public class GuiButton extends MovieClip
	{
		public var art:MovieClip;
		public var id:int;
		public var hover:Boolean;
		public var buttonenabled:Boolean;
		
		public var posX:Number;
		public var posY:Number;
		public var detectionX1:Number;
		public var detectionY1:Number;
		public var detectionX2:Number;
		public var detectionY2:Number;
		
		public function GuiButton(i:int, a:MovieClip, px:Number, py:Number, dx1:Number, dy1:Number, dx2:Number, dy2:Number) 
		{
			id = i;
			art = a;
			addChild(art);
			
			posX = px;
			posY = py;
			detectionX1 = dx1;
			detectionY1 = dy1;
			detectionX2 = dx2;
			detectionY2 = dy2;
			
			x = px;
			y = py;
			
			buttonenabled = true;
			setHover(false);
		}
		
		public function setHover(h:Boolean):void
		{
			if (buttonenabled)
			{
				if (h)
				{
					if (!hover)
					{
						//SoundPlayer.playSoundEffect(SoundList.list_sounds[4]);
						hover = true;
					}
					art.gotoAndStop(2);
				}
				else
				{
					hover = false;
					art.gotoAndStop(1);
				}
			}
		}
		
		public function setEnabled(e:Boolean):void
		{
			buttonenabled = e;
			if (buttonenabled)
			{
				art.gotoAndStop(1);
			}
			else
			{
				art.gotoAndStop(3);
			}
		}
	}
}