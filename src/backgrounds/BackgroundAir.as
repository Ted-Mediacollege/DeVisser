package backgrounds 
{
	import level.World;
	
	/*
	 * Movie op de achtergrond
	 * tijdens het spel.
	 * 
	 * parameters:
	 * - px: X positie
	 * - py: Y positie
	 * 
	 * eigenschappen:
	 * - art: de Movieclip
	 * - speed: de snelheid waarmee hij zich moet verplaatsen
	 */
	
	public class BackgroundAir extends Background
	{
		public function BackgroundAir(px:Number, py:Number) 
		{
			art = new ArtAir();
			addChild(art);
			
			speed = 0;
			
			art.gotoAndStop(World.leveltype);
			
			x = px;
			y = py;
		}	
	}
}