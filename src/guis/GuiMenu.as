package guis 
{
	import flash.system.fscommand;
	import data.DataGame;
	import data.SaveData;
	
	public class GuiMenu extends Gui
	{
		public var button_Start:GuiButton;
		public var button_High:GuiButton;
		public var button_Inst:GuiButton;
		public var button_Cre:GuiButton;
		public var button_Shop:GuiButton;
		public var button_Ach:GuiButton;
		public var button_Exit:GuiButton;
		
		public var background:GuiArt;
		public var infoText:GuiText;
		public var versText:GuiText;
		public var networkText:GuiText;
		
		private var main:Main;
		
		public function GuiMenu(m:Main) 
		{
			main = m;
		}	
		
		override public function guiInit():void
		{
			button_Start = new GuiButton(0, new ArtButtonMain_Play(), -300, 70, 0, 0, 650, 91);
			button_Shop = new GuiButton(4, new ArtButtonMain_Shop(), -300, 180, 0, 0, 650, 91); 
			button_High = new GuiButton(1, new ArtButtonMain_High(), -300, 290, 0, 0, 650, 91);
			button_Ach = new GuiButton(5, new ArtButtonMain_Ach(), -300, 400, 0, 0, 650, 91);
			button_Inst = new GuiButton(2, new ArtButtonMain_Inst(), -300, 510, 0, 0, 650, 91);
			button_Cre = new GuiButton(3, new ArtButtonMain_Cre(), -300, 620, 0, 0, 650, 91);
			button_Exit = new GuiButton(6, new ArtButtonMain_Exit(), -300, 730, 0, 0, 650, 91);
			background = new GuiArt(new ArtGuiBackgroundMain(), -4, -4, 1.01, 1.01);
			infoText = new GuiText("Naam: " + DataGame.name + "     Score: " + DataGame.score + "     Geld: " + DataGame.coins, 360, 10, 900, 26, "right", 0xFFFFFF);
			versText = new GuiText("De Visser " + DataGame.version + " - " + DataGame.buildname, 860, 865, 400, 22, "right", 0xFFFFFF);
			networkText = new GuiText("Kan geen verbinding maken met highscore server!", 20, 865, 600, 22, "left", 0xFF0000);

			if (Main.network)
			{
				networkText.alpha = 0;
			}
			
			buttonlist.push(button_Start);
			buttonlist.push(button_High);
			buttonlist.push(button_Inst);
			buttonlist.push(button_Cre);
			buttonlist.push(button_Shop);
			buttonlist.push(button_Ach);
			buttonlist.push(button_Exit);
			
			addChild(background);
			addChild(button_Start);	
			addChild(button_High);	
			addChild(button_Inst);	
			addChild(button_Cre);	
			addChild(button_Shop);
			addChild(button_Ach);
			addChild(button_Exit);	
			addChild(infoText);
			addChild(versText);
			addChild(networkText);
		}
		
		override public function action(id:int):void
		{
			if (id == 0)
			{
				main.switchGui(true, new GuiSelect(main));
			}
			else if (id == 1)
			{
				main.switchGui(true, new GuiHighscore(main, 1));
			}
			else if (id == 2)
			{
				main.switchGui(true, new GuiInstructions(main));
			}
			else if (id == 3)
			{
				main.switchGui(true, new GuiCredits(main));
			}
			else if (id == 4)
			{
				main.switchGui(true, new GuiShop(main));
			}
			else if (id == 5)
			{
				main.switchGui(true, new GuiAchievements(main));
			}
			else if (id == 6)
			{
				if (Main.saving)
				{
					SaveData.save();
				}
				fscommand("quit");
			}
		}
		
		override public function tick(keyinput:Array):void
		{
		}
	}
}