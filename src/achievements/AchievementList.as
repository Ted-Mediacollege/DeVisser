package achievements 
{
	/*
	 * Array met alle achievements
	 * uit het spel.
	 * 
	 * parameters:
	 * - id: de id van het achievement
	 * - icon: de icon van het achievement
	 * - name: de naam van de achievement
	 * - task: de task van de achievement
	*/

	public class AchievementList 
	{
		public static var list:Array = new Array(
			new Achievement(0, 4, "De bemanning", "Bekijk de credits."),
			new Achievement(1, 12, "Barrels!", "Speel in de barrel."),
			new Achievement(2, 8, "Snelheids meester!", "Speel in de speedboot op \"meester\"."),
			new Achievement(3, 10, "AARRHHH", "Speel met de piraat in de zeilboot."),
			new Achievement(4, 9, "Boot liefhebber", "Vaar in alle boten."),
			new Achievement(5, 11, "Avonturier", "Speel in alle levels."),
			new Achievement(6, 5, "Beginner", "Vang 100 vissen."),
			new Achievement(7, 6, "Ervaren", "vang 250 vissen."),
			new Achievement(8, 7, "Meester", "Vang 500 vissen."),
			new Achievement(9, 1, "15 Minuten", "Speel langer dan 15 minuten."),
			new Achievement(10, 2, "30 Minuten", "Speel langer dan 30 minuten."),
			new Achievement(11, 3, "60 Minuten", "Speel langer dan 60 minuten.")
		);
	}
}