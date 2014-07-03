package effects 
{
	import flash.display.MovieClip;
	
	/* Effect movieclips
	 * 
	 * effect wordt verwijdert waneer done op true staat
	 * 
	 * methods:
	 * tick() wordt elke frame aangeroepen
	 * 
	 * eigenschappen:
	 * - velX: de x-velocity van het effect
	 * - velY: de y-velocity van het effect
	 * - art: de art van de movieclip
	 * - done: is de effect klaar met afspelen
	 */
	
	public class Effect extends MovieClip
	{
		public var velX:Number;
		public var velY:Number;
		public var art:MovieClip;
		public var done:Boolean;
		
		public function tick():void
		{
			
		}
	}
}