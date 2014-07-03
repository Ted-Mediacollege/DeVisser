package data 
{
	import flash.display.MovieClip;
		
	/* data van een boot
	 * 
	 * parameters:
	 * - a: Movieclip van de boot
	 * - b: Of de boot al gekocht is
	 * - c: Hoeveel de boot kost
	 * 
	 * eigenschappen:
	 * - Movieclip van de boot
	 * - cost: Hoeveel de boot kost
	 * - bought: Of de boot al gekocht is
	 */
		
	public class DataBoat 
	{
		public var art:MovieClip;
		public var cost:int;
		public var bought:Boolean;
		
		public function DataBoat(a:MovieClip, b:Boolean, c:int) 
		{
			art = a;
			cost = c;
			bought = b;
		}	
	}
}