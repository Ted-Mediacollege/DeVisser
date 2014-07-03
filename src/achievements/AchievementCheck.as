package achievements 
{
	import data.DataGame;
	import data.SaveData;
	
	/*
	 * Een lijst met functies die
	 * vaak worden aangeroepen om
	 * te checken of een achievement
	 * behaald is.
	 * 
	 * 
	 * methods:
	 * - checkFish() kijkt of er een vis achievement kan behaald worden
	 * - checkCredits() kijkt of de credits achievement behaald kan worden
	 * - boatCheck(int, int, int) kijkt of de boat achievements behaald kunnen worden
	 * - timeCheck() kijkt of de tijd achievements behaald kunnen worden
	 */
	
	public class AchievementCheck 
	{
		public static function checkFish():void
		{
			if (AchievementList.list[6].done == false && DataGame.fishcought > 99)
			{
				AchievementList.list[6].done = true;
				AchievementPopup.addToQueue(AchievementList.list[6].icon, AchievementList.list[6].name, AchievementList.list[6].task);
				SaveData.save();
			}
			
			if (AchievementList.list[7].done == false && DataGame.fishcought > 249)
			{
				AchievementList.list[7].done = true;
				AchievementPopup.addToQueue(AchievementList.list[7].icon, AchievementList.list[7].name, AchievementList.list[7].task);
				SaveData.save();
			}
			
			if (AchievementList.list[8].done == false && DataGame.fishcought > 499)
			{
				AchievementList.list[8].done = true;
				AchievementPopup.addToQueue(AchievementList.list[8].icon, AchievementList.list[8].name, AchievementList.list[8].task);
				SaveData.save();
			}
		}
		
		public static function checkCredits():void
		{
			if (AchievementList.list[0].done == false)
			{
				AchievementList.list[0].done = true;
				AchievementPopup.addToQueue(AchievementList.list[0].icon, AchievementList.list[0].name, AchievementList.list[0].task);
				SaveData.save();
			}
		}
		
		public static function boatCheck(playerID:int, boatID:int, difficulty:int):void
		{
			if (boatID == 3)
			{
				AchievementList.list[1].done = true;
				AchievementPopup.addToQueue(AchievementList.list[1].icon, AchievementList.list[1].name, AchievementList.list[1].task);
				SaveData.save();
			}
			
			if (difficulty == 3 && boatID == 2) //Snelheids meester!
			{
				AchievementList.list[2].done = true;
				AchievementPopup.addToQueue(AchievementList.list[2].icon, AchievementList.list[2].name, AchievementList.list[2].task);
				SaveData.save();
			}
			
			if (playerID == 2 && boatID == 4) //AARRHHH
			{
				AchievementList.list[3].done = true;
				AchievementPopup.addToQueue(AchievementList.list[3].icon, AchievementList.list[3].name, AchievementList.list[3].task);
				SaveData.save();
			}
		}
		
		public static function timeCheck():void
		{
			if (AchievementList.list[9].done == false && DataGame.playtime > 60*15)
			{
				AchievementList.list[9].done = true;
				AchievementPopup.addToQueue(AchievementList.list[9].icon, AchievementList.list[9].name, AchievementList.list[9].task);
				SaveData.save();
			}
			
			if (AchievementList.list[10].done == false && DataGame.playtime > 60*30)
			{
				AchievementList.list[10].done = true;
				AchievementPopup.addToQueue(AchievementList.list[10].icon, AchievementList.list[10].name, AchievementList.list[10].task);
				SaveData.save();
			}
			
			if (AchievementList.list[11].done == false && DataGame.playtime > 60*60)
			{
				AchievementList.list[11].done = true;
				AchievementPopup.addToQueue(AchievementList.list[11].icon, AchievementList.list[11].name, AchievementList.list[11].task);
				SaveData.save();
			}
		}
	}
}