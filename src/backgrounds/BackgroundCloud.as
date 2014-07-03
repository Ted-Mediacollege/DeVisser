package backgrounds 
{
	import level.World;
	
	/*
	 * Wolken in het spel.
	 * 
	 * parameters:
	 * - px: X positie
	 * - py: Y positie
	 * 
	 * eigenschappen:
	 * - art: de Movieclip
	 * - speed: de snelheid waarmee hij zich moet verplaatsen
	 */
	
	public class BackgroundCloud extends Background
	{
		public function BackgroundCloud(px:Number, py:Number) 
		{
			art = new ArtCloud1();
			addChild(art);
			
			speed = 0.25;
			
			art.gotoAndStop(1 + ((World.leveltype - 1) * 5) + Math.floor(Math.random() * 5));
			
			x = px;
			y = py;
		}
	}
}