package guis 
{
	public class GuiInstructions extends Gui
	{
		public var button_Menu:GuiButton;
		public var background:GuiArt;
		
		private var main:Main;
		
		public function GuiInstructions(m:Main) 
		{
			main = m;
		}
		
		override public function guiInit():void
		{
			button_Menu = new GuiButton(0, new ArtButtonPause_Menu(), 645, 846, -164, -49, 328, 98);
			background = new GuiArt(new ArtGuiBackgroundInst(), 0, 0, 1, 1);
			
			buttonlist.push(button_Menu);
			
			addChild(background);
			addChild(button_Menu);	
		}
		
		override public function action(id:int):void
		{
			if (id == 0)
			{
				main.switchGui(true, new GuiMenu(main));
			}
		}
	}
}