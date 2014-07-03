package guis 
{
	import network.GetData;
	import data.DataGame;
	
	public class GuiHighscore extends Gui
	{
		private var main:Main;
		public var listselected:int;
		public var loaded:Boolean;
		
		public var background1:GuiArt;
		public var background2:GuiArt;
		public var button_menu:GuiButton;
		public var button_beginner:GuiButtonPress;
		public var button_ervaren:GuiButtonPress;
		public var button_meester:GuiButtonPress;
		public var button_switch:GuiButtonSelect;
		
		public var online:Boolean;
		
		public var Text_Scores:GuiText;
		public var Text_Names:GuiText;
		public var Text_Dates:GuiText;
		public var Text_Network1:GuiText;
		public var Text_Network2:GuiText;
		public var TextArray_Scores:Array;
		public var TextArray_Names:Array;
		public var TextArray_Dates:Array;
		
		public function GuiHighscore(m:Main, l:int) 
		{
			main = m;
			listselected = l;
		}
		
		override public function guiInit():void
		{
			Text_Network1 = new GuiText("Online highscore is uitgeschakelt op mac \n in verband met network errors!", 800, 430, 400, 20, "center", 0xFF0000);
			Text_Network2 = new GuiText("Kan geen verbinding maken \n met de highscore database!", 800, 430, 400, 20, "center", 0xFF0000);
			Text_Scores = new GuiText("Naam:", 530, 90, 300, 28, "left", 0xFFFFFF);
			Text_Names = new GuiText("Score:", 730, 90, 300, 28, "left", 0xFFFFFF);
			Text_Dates = new GuiText("Datum:", 930, 90, 300, 28, "left", 0xFFFFFF);
			TextArray_Scores = new Array();
			TextArray_Names = new Array();
			TextArray_Dates = new Array();
			
			background1 = new GuiArt(new ArtGuiBackgroundHighscore1(), 0, 0, 1, 1);
			background2 = new GuiArt(new ArtGuiBackgroundHighscore2(), 480, 50, 1, 1);
			button_menu = new GuiButton(0, new ArtButtonPause_Menu(), 110 + 164, 805, -164, -49, 328, 98);
			button_beginner = new GuiButtonPress(2, new ArtButtonHigh_Beginner(), 110, 253 + 40, 0, 0, 328, 98);
			button_ervaren = new GuiButtonPress(3, new ArtButtonHigh_Ervaren(), 110, 353 + 50, 0, 0, 328, 98);
			button_meester = new GuiButtonPress(4, new ArtButtonHigh_Meester(), 110, 453 + 60, 0, 0, 328, 98);
			button_switch = new GuiButtonSelect(5, new ArtButtonHigh_Switch(), 110, 50, 0, 0, 328, 98, 2);
			
			buttonlist.push(button_menu);
			buttonlist.push(button_beginner);
			buttonlist.push(button_ervaren);
			buttonlist.push(button_meester);
			buttonlist.push(button_switch);
			
			addChild(background1);
			addChild(background2);
			addChild(Text_Scores);
			addChild(Text_Names);
			addChild(Text_Dates);
			addChild(button_menu);
			addChild(button_beginner);
			addChild(button_ervaren);
			addChild(button_meester);
			addChild(button_switch);
			addChild(Text_Network1);
			addChild(Text_Network2);
			
			online = false;
			loaded = false;
			button_switch.setFrame(1);
			
			loadLocalscore(listselected);

			button_beginner.press(true);
			button_ervaren.press(false); 
			button_meester.press(false);
			
			if (Main.isMac && !Main.network && online)
			{
				Text_Network1.alpha = 1;
				Text_Network2.alpha = 0;
			}
			else if(!Main.network && online)
			{
				Text_Network1.alpha = 0;
				Text_Network2.alpha = 1;
			}
			else
			{
				Text_Network1.alpha = 0;
				Text_Network2.alpha = 0;
			}
		}
		
		override public function action(id:int):void
		{
			if (id == 0)
			{
				destroyList();
				main.switchGui(true, new GuiMenu(main));
			}
			if (online && id > 1 && id < 5)
			{
				if (id == 2)
				{
					trace("LOADING: list_beginner");
					destroyList();
					listselected = 1;
					GetData.loadHighscore("list_beginner");
					button_beginner.press(true);
					button_ervaren.press(false); 
					button_meester.press(false);
				}
				if (id == 3)
				{
					trace("LOADING: list_ervaren");
					destroyList();
					listselected = 2;
					GetData.loadHighscore("list_ervaren");
					button_beginner.press(false);
					button_ervaren.press(true); 
					button_meester.press(false);
				}
				if (id == 4)
				{
					trace("LOADING: list_meester");
					destroyList();
					listselected = 3;
					GetData.loadHighscore("list_meester");
					button_beginner.press(false);
					button_ervaren.press(false); 
					button_meester.press(true);
				}
			}
			else if(id > 1 && id < 5)
			{
				trace("LOADING: local");
				destroyList();
				loadLocalscore(id - 1);
				listselected = id - 1;
			}
			if (id == 5)
			{
				if (online)
				{
					online = false;
					button_switch.setFrame(1);
					trace("LOADING: local");
					destroyList();
					loadLocalscore(listselected);
				}
				else
				{
					online = true;
					button_switch.setFrame(2);
					
					if (listselected == 1)
					{
						trace("LOADING: list_beginner");
						destroyList();
						GetData.loadHighscore("list_beginner");
						button_beginner.press(true);
						button_ervaren.press(false); 
						button_meester.press(false);
					}
					if (listselected == 2)
					{
						trace("LOADING: list_ervaren");
						destroyList();
						GetData.loadHighscore("list_ervaren");
						button_beginner.press(false);
						button_ervaren.press(true); 
						button_meester.press(false);
					}
					if (listselected == 3)
					{
						trace("LOADING: list_meester");
						destroyList();
						GetData.loadHighscore("list_meester");
						button_beginner.press(false);
						button_ervaren.press(false); 
						button_meester.press(true);
					}
				}
			}
			
			if (Main.isMac && !Main.network && online)
			{
				Text_Network1.alpha = 1;
				Text_Network2.alpha = 0;
			}
			else if(!Main.network && online)
			{
				Text_Network1.alpha = 0;
				Text_Network2.alpha = 1;
			}
			else
			{
				Text_Network1.alpha = 0;
				Text_Network2.alpha = 0;
			}
		}
		
		override public function tick(keyinput:Array):void
		{
			
		}
		
		public function destroyList():void
		{
			trace("DESTROYING");
			
			loaded = false;
			
			for (var i:int = 0; i < TextArray_Scores.length; i++ )
			{
				removeChild(TextArray_Scores[i]);
			}
			
			for (var j:int = 0; j < TextArray_Names.length; j++ )
			{
				removeChild(TextArray_Names[j]);
			}
			
			for (var k:int = 0; k < TextArray_Dates.length; k++ )
			{
				removeChild(TextArray_Dates[k]);
			}
			
			TextArray_Scores = new Array();
			TextArray_Names = new Array();
			TextArray_Dates = new Array();
		}
		
		public function loadLocalscore(id:int):void
		{
			if (loaded == true)
			{
				destroyList();
			}
			
			var dataArray:Array;	
			if(id == 1) { dataArray = DataGame.score_local_beginner; }
			if(id == 2) { dataArray = DataGame.score_local_ervaren; }
			if(id == 3) { dataArray = DataGame.score_local_meester; }
			
			var count:int = -1;
			for (var i:int = 0; i < dataArray.length; i+=3)
			{
				count++;
				if (dataArray[i + 0] != "empty")
				{
					var scoretext:GuiText = new GuiText(dataArray[i + 0], 530, 180 + (64 * count), 205, 25, "left", 0xFFFFFF);
					TextArray_Scores.push(scoretext);
					addChild(scoretext);
					
					var nametext:GuiText = new GuiText(dataArray[i + 1], 730, 180 + (64 * count), 205, 25, "left", 0xFFFFFF);
					TextArray_Names.push(nametext);
					addChild(nametext);
					
					var datetext:GuiText = new GuiText(dataArray[i + 2], 930, 180 + (64 * count), 214, 25, "left", 0xFFFFFF);
					TextArray_Dates.push(datetext);
					addChild(datetext);
				}
			}
		}
		
		override public function receivedata(id:int, datainput:String):void
		{
			trace("RECIEVE: " + id);
			
			if (id == listselected)
			{
				if (loaded == true)
				{
					destroyList();
				}
				
				loaded == true;
				var dataArray:Array = datainput.split("&");
				for (var i:int = 0; i < dataArray.length; i++ )
				{
					var itemArray:Array = dataArray[i].split("=");
					
					if (itemArray[0] != "empty")
					{
						var scoretext:GuiText = new GuiText(itemArray[0], 530, 180 + (64 * i), 205, 25, "left", 0xFFFFFF);
						TextArray_Scores.push(scoretext);
						addChild(scoretext);
						
						var nametext:GuiText = new GuiText(itemArray[1], 730, 180 + (64 * i), 205, 25, "left", 0xFFFFFF);
						TextArray_Names.push(nametext);
						addChild(nametext);
						
						var datetext:GuiText = new GuiText(itemArray[2], 930, 180 + (64 * i), 214, 25, "left", 0xFFFFFF);
						TextArray_Dates.push(datetext);
						addChild(datetext);
					}
				}
			}
		}
	}
}