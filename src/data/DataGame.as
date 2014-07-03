package data 
{
	/*
	 * Alle belangrijke data in het spel.
	 * 
	 * eigenschappen:
	 * - version: De versie van het spel.
	 * - buildname: De bouw naam van het spel.
	 * - name: de naam van de speler.
	 * - score: totaal behaalde score.
	 * - coins: aantal coins de player bezit.
	 * - players: alle players.
	 * - boats: alle boten.
	 * - playtime: totaal aantal speeltijd.
	 * - score_local_beginner: opgeslage beginner score.
	 * - score_local_ervaren: opgeslage ervaren score.
	 * - score_local_meester: opgeslage meester score.
	 * - fishcought: totaal aantal vis gevangen.
	 */
	
	public class DataGame 
	{		
		public static var version:String = "V0.6.2";
		public static var buildname:String = "prototype 3";
		
		public static var name:String = "";
		public static var score:int = 0;
		public static var coins:int = 0;
		
		public static var players:Array = new Array(
			new DataPlayer(new ArtPlayer1(), true, 0), 
			new DataPlayer(new ArtPlayer2(), false, 500),
			new DataPlayer(new ArtPlayer3(), false, 2000), 
			new DataPlayer(new ArtPlayer4(), false, 3000),
			new DataPlayer(new ArtPlayer5(), false, 1000), 
			new DataPlayer(new ArtPlayer6(), false, 1000) 
		);
		
		public static var boats:Array = new Array(
			new DataBoat(new ArtBoat1(), true, 0), 
			new DataBoat(new ArtBoat2(), false, 500),
			new DataBoat(new ArtBoat3(), false, 1000), 
			new DataBoat(new ArtBoat4(), false, 1500), 
			new DataBoat(new ArtBoat5(), false, 2000), 
			new DataBoat(new ArtBoat6(), false, 3000), 
			new DataBoat(new ArtBoat7(), false, 4000)
		);
		
		public static var playtime:int = 0;
		
		public static var score_local_beginner:Array = new Array(
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0"
		);
		
		public static var score_local_ervaren:Array = new Array(
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0"
		);
		
		public static var score_local_meester:Array = new Array(
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0",
			"empty", 0, "0-0-0"
		);
		
		public static var fishcought:int = 0;
	}
}