package guis 
{
	import data.DataGame;
	
	public class GuiIntro extends Gui
	{
		private var main:Main;
		
		public var blackscreen:GuiArt;
		public var logo:GuiArt;
		
		public var blackalpha:int;
		public var state:Boolean;
		
		public function GuiIntro(m:Main) 
		{
			main = m;
		}
		
		override public function guiInit():void
		{
			logo = new GuiArt(new ArtGuiBackgroundLogo2, -270, 0, 1.7, 1.7);
			blackscreen = new GuiArt(new ArtGuiBackgroundBlack, 0, 0, 1, 1);
			
			state = false;
			blackalpha = 99;
			
			addChild(logo);
			addChild(blackscreen);
		}
		
		override public function action(id:int):void
		{
		}
		
		public function nextgui():void 
		{
			if (DataGame.name.length > 0)
			{
				main.switchGui(true, new GuiMenu(main));
			}
			else
			{
				main.switchGui(true, new GuiNameInput(main));
			}
		}
		
		override public function tick(keyinput:Array):void
		{
			if (keyinput[0])
			{
				nextgui();
			}
			
			if (!state)
			{
				blackalpha -= 2;
				if (blackalpha > -1)
				{
					blackscreen.alpha = blackalpha / 100;
				}
				else if(blackalpha < -100)
				{
					state = true;
				}
			}
			else
			{
				blackalpha += 2;
				if (blackalpha > 0 && blackalpha < 100)
				{
					blackscreen.alpha = blackalpha / 100;
				}
				else if(blackalpha > 120)
				{
					nextgui();
				}
			}
		}
	}
}