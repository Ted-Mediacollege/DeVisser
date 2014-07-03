package backgrounds 
{
	import flash.display.MovieClip;
	
	/*
	 * Background movieclips
	 * 
	 * Alle achtergrond objecten worden
	 * met tick() verplaatst naar links
	 * op basis van de snelheid.
	 *
	 * eigenschappen:
	 * - art: de Movieclip
	 * - speed: de snelheid waarmee hij zich moet verplaatsen
	 * 
	 * methods:
	 * - tick() wordt elke frame aangeroepen
	 */
	
	public class Background extends MovieClip 
	{
		public var art:MovieClip;
		public var speed:Number;
		
		public function tick():void
		{
			x -= speed;
		}
	}
}