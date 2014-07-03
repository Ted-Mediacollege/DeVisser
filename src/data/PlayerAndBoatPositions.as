package data 
{
	/* Data voor het positioneeren van players en vislijnen.
	 * 
	 * PlayerX: Array met x-positie zitplek in iedere boot
	 * PlayerY: Array met y-positie zitplek in iedere boot
	 * FishlineX: Array met x-positie van alle hengel eindes
	 * FishlineY: Array met y-positie van alle hengel eindes
	 */
	
	public class PlayerAndBoatPositions 
	{
		public static var playerX:Array = new Array(300, 150, 300, 205, 300, 205, 225);
		public static var playerY:Array = new Array(200, 180, 200, 170, 200, 200, 195);
		public static var FishlineX:Array = new Array(301, 290, 287, 292, 292, 292);
		public static var FishlineY:Array = new Array(-131, -120, -119, -118, -118, -118);
	}
}