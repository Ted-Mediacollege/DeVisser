package data 
{
	import flash.net.SharedObject;
	import data.DataGame;
	import achievements.AchievementList;
	
	/* De class waar alle data wordt geladen en gesaved.
	 * 
	 * Alle data wordt opgeslagen met sharedObject.
	 * de naam van de savefile is "devissergame"
	 *
	 * eigenschappen:
	 * - saveFile: de sharedObject waar alles in wordt opgeslagen
	 * 
	 * functies:
	 * - reset() Maakt de hele savefile leeg. (wordt alleen gebruikt met testen)
	 * - save() Slaat alle data op.
	 * - load() Laad alle data.
	 */
	
	public class SaveData 
	{
		public static var saveFile:SharedObject;
		
		public function SaveData()
		{
			saveFile = SharedObject.getLocal("devissergame");
		}
		
		public static function reset():void
		{
			saveFile.clear();
		}
		
		public static function save():void
		{
			trace("SAVING...");
			
			saveFile.data.name = DataGame.name;
			saveFile.data.score = DataGame.score;
			saveFile.data.coins = DataGame.coins;
			
			var boatarray:Array = new Array();
			for (var i:int = 0; i < DataGame.boats.length; i++ )
			{
				boatarray.push(DataGame.boats[i].bought);
			}
			saveFile.data.boats = boatarray;
			
			var playersarray:Array = new Array();
			for (var j:int = 0; j < DataGame.players.length; j++ )
			{
				playersarray.push(DataGame.players[j].bought);
			}
			saveFile.data.players = playersarray;
			
			saveFile.data.score1 = DataGame.score_local_beginner;
			saveFile.data.score2 = DataGame.score_local_ervaren;
			saveFile.data.score3 = DataGame.score_local_meester;
			
			var achievementsarray:Array = new Array();
			for (var k:int = 0; k < AchievementList.list.length; k++ )
			{
				var done:Boolean = AchievementList.list[k].done;
				achievementsarray.push(done);
			}
			saveFile.data.achiev = achievementsarray;
			
			saveFile.data.playtime = DataGame.playtime;
			saveFile.data.fishcought = DataGame.fishcought;
			
			saveFile.flush();
		}
		
		public static function load():void
		{	
			trace("LOADING...");
			
			if (saveFile.data.name != null) { DataGame.name = saveFile.data.name; }
			if (saveFile.data.score != null) { DataGame.score = saveFile.data.score; }
			if (saveFile.data.coins != null) { DataGame.coins = saveFile.data.coins; }
			
			if (saveFile.data.boats != null) 
			{ 
				var boatarray:Array = saveFile.data.boats; 
				for (var i:int = 0; i < boatarray.length; i++ )
				{
					DataGame.boats[i].bought = boatarray[i];
				}
			}
			if (saveFile.data.players != null) 
			{ 
				var playersarray:Array = saveFile.data.players; 
				for (var j:int = 0; j < playersarray.length; j++ )
				{
					DataGame.players[j].bought = playersarray[j];
				}
			}
			
			if (saveFile.data.score1 != null) { DataGame.score_local_beginner = saveFile.data.score1; }
			if (saveFile.data.score2 != null) { DataGame.score_local_ervaren = saveFile.data.score2; }
			if (saveFile.data.score3 != null) { DataGame.score_local_meester = saveFile.data.score3; }
			
			if (saveFile.data.achiev != null) 
			{
				var achievementsarray:Array = saveFile.data.achiev;
				for (var k:int = 0; k < AchievementList.list.length; k++ )
				{
					AchievementList.list[k].done = achievementsarray[k];
				}
			}
			
			if (saveFile.data.playtime != null) { DataGame.playtime = saveFile.data.playtime; }
			if (saveFile.data.fishcought != null) { DataGame.fishcought = saveFile.data.fishcought; }
		}
	}
}