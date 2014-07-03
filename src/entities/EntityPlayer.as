package entities 
{
	import level.World;
	import flash.display.MovieClip;
	import data.PlayerAndBoatPositions;
	import flash.geom.ColorTransform;
	
	/* De player in het spel
	 * 
	 * methods:
	 * - tick() wordt elke frame aangeroepen
	 * 
	 * parameters:
	 * - b: de boatart
	 * - p: de playerart
	 * 
	 * eigenschappen:
	 * - art: de movieclip van de entiteit
	 * - boatID: de boatart
	 * - playerID: de playerart
	 */
	
	public class EntityPlayer extends Entity
	{
		public var boatID:int;
		public var playerID:int;
		
		public function EntityPlayer(b:int, p:int) 
		{
			boatID = b;
			playerID = p;
			
			if(playerID == 0) { art = new ArtPlayer1(); }
			else if(playerID == 1) { art = new ArtPlayer2(); }
			else if(playerID == 2) { art = new ArtPlayer3(); }
			else if(playerID == 3) { art = new ArtPlayer4(); }
			else if(playerID == 4) { art = new ArtPlayer5(); }
			else if(playerID == 5) { art = new ArtPlayer6(); }
			else { art = new ArtPlayer1(); }
			addChild(art);
			
			if (World.leveltype == 2)
			{
				var colortransform:ColorTransform = art.transform.colorTransform;
				colortransform.blueMultiplier = 0.5;
				colortransform.redMultiplier = 0.2;
				colortransform.greenMultiplier = 0.2;
				art.transform.colorTransform = colortransform;
			}
		}	
		
		public function tick():void
		{
			x = World.boat.x + PlayerAndBoatPositions.playerX[boatID];
			y = World.boat.y + PlayerAndBoatPositions.playerY[boatID];
		}
	}
}