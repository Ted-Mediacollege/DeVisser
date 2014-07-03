package backgrounds 
{
	import flash.display.MovieClip;
	import level.World;
	
	/* De 2 grond layers in het spel.
	 * 
	 * parameters:
	 * - px: X positie
	 * - py: Y positie
	 * 
	 * eigenschappen:
	 * - art: de Movieclip
	 * - speed: de snelheid waarmee hij zich moet verplaatsen
	 */
	
	public class BackgroundGround extends Background
	{
		public function BackgroundGround(a:MovieClip, px:Number, py:Number, s:Number) 
		{
			art = a;
			addChild(art);
			
			speed = s;
			
			art.gotoAndStop(World.leveltype);
			
			x = px;
			y = py;
		}	
	}
}