package data 
{
	import flash.display.MovieClip;
		
	/* data van een player
	 * 
	 * parameters:
	 * - a: Movieclip van de player
	 * - b: Of de player al gekocht is
	 * - c: Hoeveel de player kost
	 * 
	 * eigenschappen:
	 * - Movieclip van de player
	 * - cost: Hoeveel de player kost
	 * - bought: Of de player al gekocht is
	 */
		
	public class DataPlayer 
	{
		public var art:MovieClip;
		public var cost:int;
		public var bought:Boolean;
		
		public function DataPlayer(a:MovieClip, b:Boolean, c:int) 
		{
			art = a;
			cost = c;
			bought = b;
		}
	}
}