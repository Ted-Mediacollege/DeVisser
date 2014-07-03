package guis 
{
	import data.DataGame;
	import network.SendData;
	import data.SaveData;
	
	public class GuiGameOver extends Gui
	{
		public var background:GuiArt;
		public var button_Menu:GuiButton;
		public var button_Score:GuiButton;
		public var text_score:GuiText;
		
		private var main:Main;
		
		private var difficulty:int;
		private var newscore:int;
		
		public function GuiGameOver(m:Main, d:int, s:int, c:int) 
		{
			main = m;
			DataGame.score += s;
			DataGame.coins += c;
			difficulty = d;
			
			newscore = s;
			
			if (Main.saving)
			{
				SaveData.save();
			}
			
			var listname:String;
			if (d == 1) { listname = "list_beginner"; }
			else if (d == 2) { listname = "list_ervaren"; }
			else if (d == 3) { listname = "list_meester"; }
			else { listname = "list_meester"; }
			
			SendData.sendHighscore(listname, s);
			updateLocalScore(d, DataGame.name, s);
		}	
		
		override public function guiInit():void
		{
			background = new GuiArt(new ArtGuiBackgroundGameOver(), -8, -8, 1.05, 1.05);
			button_Menu = new GuiButton(0, new ArtButtonOver_Menu(), 475, 645, -164, -49, 328, 98);
			button_Score = new GuiButton(1, new ArtButtonOver_Score(), 825, 645, -164, -49, 328, 98);
			text_score = new GuiText("Score: " + newscore, 660, 515, 400, 60, "center", 0xFFFFFF);
			
			buttonlist.push(button_Menu);
			buttonlist.push(button_Score);
			
			addChild(background);
			addChild(button_Menu);	
			addChild(button_Score);
			addChild(text_score);
		}
		
		override public function action(id:int):void
		{
			if (id == 0)
			{
				main.switchGui(true, new GuiMenu(main));
			}
			if (id == 1)
			{
				main.switchGui(true, new GuiHighscore(main, difficulty));
			}
		}
		
		public function updateLocalScore(list:int, name:String, score:int):void
		{
			if (list > 0 && list < 4)
			{
				var date:Date = new Date;
				var d:Number = date.date;
				var m:Number = date.month;
				var y:Number = date.fullYear;
				
				var scoreArray:Array;
				if (list == 1) { scoreArray = DataGame.score_local_beginner; }
				if (list == 2) { scoreArray = DataGame.score_local_ervaren; }
				if (list == 3) { scoreArray = DataGame.score_local_meester; }
				
				var count:int = -1;
				for (var i:int = 0; i < scoreArray.length; i+=3 )
				{
					if (score > scoreArray[i + 1])
					{
						scoreArray.splice(i, 0, name, score, + d + "-" + m + "-" + y);
						
						scoreArray.pop();
						scoreArray.pop();
						scoreArray.pop();
						break;
					}
				}
				
				if (list == 1) { DataGame.score_local_beginner = scoreArray; }
				if (list == 2) { DataGame.score_local_ervaren = scoreArray; }
				if (list == 3) { DataGame.score_local_meester = scoreArray; }
			}
		}
	}
}