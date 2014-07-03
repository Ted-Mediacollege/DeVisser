package backgrounds 
{
	import level.World;
		
	/* De golfen in het spel.
	 * 
	 * parameters:
	 * - px: X positie
	 * - py: Y positie
	 * 
	 * eigenschappen:
	 * - art: de Movieclip
	 * - speed: de snelheid waarmee hij zich moet verplaatsen
	 */
		
	public class BackgroundWaveTop extends Background
	{
		public function BackgroundWaveTop(px:Number, py:Number) 
		{
			art = new ArtWaveTop();
			addChild(art);
			
			speed = 1.5;
			
			art.gotoAndStop(World.leveltype);
			
			x = px;
			y = py;
		}
	}
}