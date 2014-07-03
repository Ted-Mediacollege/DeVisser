package entities 
{
	import flash.display.MovieClip;
	import util.Coords;
	import level.World;
	import flash.display.Graphics;
	import data.PlayerAndBoatPositions;
	import flash.geom.ColorTransform;
	import sounds.SoundPlayer;
	
	/* De haak in het spel. de bestuuring wordt door gegeven
	 * met de boolean parameter in tick(), waneer de die true
	 * is gaat de speed omlaag anders gaat hij omhoog
	 * 
	 * methods:
	 * - tick(boolean) wordt elke frame aangeroepen
	 * - calcHitPositions() bereekente de hitArrayX en Y
	 * 
	 * parameters:
	 * - a: de movieclip van de haak
	 * - l: afstand tussen haak en hengel
	 * - id: de playerart
	 * 
	 * eigenschappen:
	 * - art: de movieclip van de entiteit
	 * - line: afstand tussen hengel en haak
	 * - speed: snelheid waarmee de haak zich op en neer beweegt
	 * - hitArrayX: alle x-posities waar de world moet kijken of hij een object raakt
	 * - hitArrayY: alle y-posities waar de world moet kijken of hij een object raakt
	 * - playerID: de playerart
	 * - state: of de haak omhoog of naar beneden gaat (wordt gebruikt voor sound)
	 */
		
	public class EntityHook extends Entity
	{	
		public var line:Number;
		public var speed:Number = 0;
		public var hitArrayX:Array;
		public var hitArrayY:Array;
		private var playerID:int;
		public var state:Boolean;
		
		public function EntityHook(a:MovieClip, l:Number, id:int) 
		{
			art = a;
			addChild(art);
			line = 400;
			playerID = id;
			state = false;
			
			hitArrayX = new Array();
			hitArrayY = new Array();
			
			if (World.leveltype == 2)
			{
				var colortransform:ColorTransform = art.transform.colorTransform;
				colortransform.blueMultiplier = 0.5;
				colortransform.redMultiplier = 0.2;
				colortransform.greenMultiplier = 0.2;
				art.transform.colorTransform = colortransform;
			}
			
			calcHitPositions();
		}	
		
		public function tick(space:Boolean):void
		{	
			if (space)
			{
				if (!state && line > 180)
				{
					SoundPlayer.playRodSound();
					state = true;
				}
				else if(line < 181)
				{
					SoundPlayer.stopRodSound();
					state = false;
				}
				
				if (line < 180)
				{
					line = 180;
					speed = 0;
				}
				else if (speed > -8 - (World.speed * 4.5))
				{
					speed -= (1 + World.speed) / 2;
				}
			}
			else
			{
				if (state)
				{
					SoundPlayer.stopRodSound();
					state = false;
				}
				if (line > 600)
				{
					speed = 0;
				}
				else if (line < 180)
				{
					line = 180;
					speed = 0;
				}
				else if(speed < 4 + (World.speed * 2.3))
				{
					speed += (0.25 + (World.speed / 4.5)) / 2;
				}
			}			
			
			line += speed / 2;
			
			x = Coords.getNextX(World.player.x + PlayerAndBoatPositions.FishlineX[playerID], 110, line);
			y = Coords.getNextY(World.player.y + PlayerAndBoatPositions.FishlineY[playerID], 110, line);
			
			rotation = 90 + Coords.getDegreeFromPoint(x, y, World.player.x + PlayerAndBoatPositions.FishlineX[playerID], World.player.y + PlayerAndBoatPositions.FishlineY[playerID]);
		}
		
		public function calcHitPositions():void
		{
			hitArrayX[0] = Coords.getNextX(0, 74, 58);
			hitArrayY[0] = Coords.getNextY(0, 74, 58);
			
			hitArrayX[1] = Coords.getNextX(0, 88, 68);
			hitArrayY[1] = Coords.getNextY(0, 88, 68);
			
			hitArrayX[2] = Coords.getNextX(0, 102, 78);
			hitArrayY[2] = Coords.getNextY(0, 102, 78);
			
			hitArrayX[3] = Coords.getNextX(0, 108, 92);
			hitArrayY[3] = Coords.getNextY(0, 108, 92);
			
			hitArrayX[4] = Coords.getNextX(0, 106, 112);
			hitArrayY[4] = Coords.getNextY(0, 106, 112);
		}
	}
}