package guis 
{
	import data.DataGame;
	
	public class GuiNameInput extends Gui
	{
		public var button_submit:GuiButton;
		public var inputfield:GuiTextInput;
		public var inputscreen:GuiArt;
		public var inputText:GuiText;
		public var background:GuiArt;
		public var versText:GuiText;
		public var main:Main;
		
		public function GuiNameInput(m:Main) 
		{
			main = m;
		}	
		
		override public function guiInit():void
		{
			background = new GuiArt(new ArtGuiBackgroundMain(), -4, -4, 1.01, 1.01);
			inputscreen = new GuiArt(new ArtGuiInputName(), 350, 400, 1, 1);
			inputfield = new GuiTextInput("visser", 150, 406, 370, 40, 0x000000); 
			button_submit = new GuiButton(0, new ArtButtonInput_Submit(), 350, 580, -164, -49, 328, 98);
			inputText = new GuiText("Wat is jouw naam?", 160, 320, 500, 40, "left", 0xFFFFFF);
			versText = new GuiText("De Visser " + DataGame.version + " - " + DataGame.buildname, 860, 865, 400, 22, "right", 0xFFFFFF);
			
			buttonlist.push(button_submit);
			
			addChild(background);
			addChild(inputscreen);
			addChild(inputfield);
			addChild(button_submit);
			addChild(inputText);
			addChild(versText);
		}
		
		override public function action(id:int):void
		{
			if (id == 0)
			{
				if (inputfield.text.text.length > 0)
				{
					DataGame.name = inputfield.text.text;
					main.switchGui(true, new GuiMenu(main));
				}
			}
		}
		
		override public function tick(keyinput:Array):void
		{
			if (keyinput[1] == true)
			{
				if (inputfield.text.text.length > 0)
				{
					DataGame.name = inputfield.text.text;
					main.switchGui(true, new GuiMenu(main));
				}
			}
		}
	}
}