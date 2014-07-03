package entities 
{
	import flash.display.MovieClip;
	
	/* Alle objecten in het spel
	 * 
	 * eigenschappen:
	 * - art: de movieclip van de entiteit
	 * - velX: de x-velocity van het object
	 * - velY: de y-velocity van het object
 	 * - baseY: de y positie waar het object omheen slingert
	 * - isPickup: geeft aan of het een pickup is
	 */
		
	public class EntityObject extends Entity
	{
		public var velX:Number;
		public var velY:Number;
		public var baseY:Number;
		public var isPickup:Boolean = false;
	}
}