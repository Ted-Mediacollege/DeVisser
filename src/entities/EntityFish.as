package entities 
{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import level.World;
	
	/* Alle vissen in het spel.
	 * 
	 * methods:
	 * - tick() wordt elke frame aangeroepen.
	 * 
	 * parameters:
	 * - a: de movieclip van de vis
	 * - px: de x-positie van de vis
	 * - py: de y-postite van de vis
	 * - vx: de x-velocity van de vis
	 * - vy: de y-velocity van de vis
	 * - f: de frame in de movieclip
	 * - s: de score die je van de vis krijgt
	 * 
	 * eigenschappen:
	 * - fishscore: de score die de vis geeft
	 * - art: de movieclip van de entiteit
	 * - velX: de x-velocity van het object
	 * - velY: de y-velocity van het object
 	 * - baseY: de y positie waar het object omheen slingert
	 * - isPickup: geeft aan of het een pickup is
	 */
		
	public class EntityFish extends EntityObject
	{
		public var fishscore:int;
		
		public function EntityFish(a:MovieClip, px:Number, py:Number, vx:Number, vy:Number, f:int, s:int) 
		{
			art = a;
			velX = vx;
			velY = vy;
			x = px;
			y = py;
			baseY = py;
			fishscore = s;
			
			addChild(art);
			
			if (World.leveltype == 2)
			{
				var colortransform:ColorTransform = art.transform.colorTransform;
				colortransform.blueMultiplier = 0.5;
				colortransform.redMultiplier = 0.2;
				colortransform.greenMultiplier = 0.2;
				art.transform.colorTransform = colortransform;
			}

			art.gotoAndStop(f);
		}
		
		public function tick():void
		{
			if (y > baseY)
			{
				velY -= 0.05;
			}
			else
			{
				velY += 0.05;
			}
			
			x += velX;
			y += velY / 2;
		}
	}
}