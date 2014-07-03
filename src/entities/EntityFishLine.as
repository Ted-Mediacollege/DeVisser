package entities 
{
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import level.World;
	import data.PlayerAndBoatPositions;
		
	/* De fishline tussen de hengel en de haak
	 * 
	 * methods:
	 * - draw() tekent de vis lijn
	 * 
	 * parameters:
	 * - id: de playerart
	 * 
	 * eigenschappen:
	 * - playerID: de playerart
	 */
		
	public class EntityFishLine extends MovieClip 
	{
		private var playerID:int;
		
		public function EntityFishLine(id:int) 
		{
			playerID = id;
		}	
		
		public function draw():void
		{
			graphics.clear();
			graphics.lineStyle(1, 0x000000);
			graphics.moveTo(World.player.x + PlayerAndBoatPositions.FishlineX[playerID], World.player.y + PlayerAndBoatPositions.FishlineY[playerID]);
			graphics.lineTo(World.hook.x, World.hook.y);
		}
	}
}