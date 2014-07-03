package backgrounds 
{
	import level.World;
	
	/* Het water in het spel.
	 * 
	 * parameters:
	 * - px: X positie
	 * - py: Y positie
	 * 
	 * eigenschappen:
	 * - art: de Movieclip
	 * - speed: de snelheid waarmee hij zich moet verplaatsen
	 */
		
	public class BackgroundWaveBase extends Background
	{
		public function BackgroundWaveBase(px:Number, py:Number) 
		{
			art = new ArtWaveBase();
			addChild(art);
			
			speed = 1.5;
			
			art.gotoAndStop(World.leveltype);
			
			x = px;
			y = py;
		}	
	}
}