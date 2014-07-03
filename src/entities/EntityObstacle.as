package entities 
{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import level.World;
	
	/* Alle Obstakels in het spel
	 * 
	 * methods:
	 * - tick() wordt elke frame aangeroepen.
	 * 
	 * parameters:
	 * - a: de movieclip van het obstakel
	 * - px: de x-positie van het obstakel
	 * - py: de y-postite van het obstakel
	 * - vx: de x-velocity van het obstakel
	 * - vy: de y-velocity van het obstakel
	 * 
	 * eigenschappen:
	 * - art: de movieclip van de entiteit
	 * - velX: de x-velocity van het object
	 * - velY: de y-velocity van het object
 	 * - baseY: de y positie waar het object omheen slingert
	 * - isPickup: geeft aan of het een pickup is
	 */
	
	public class EntityObstacle extends EntityObject
	{
		public function EntityObstacle(a:MovieClip, px:Number, py:Number, vx:Number, vy:Number) 
		{
			art = a;
			velX = vx;
			velY = vy;
			x = px;
			y = py;
			baseY = py;
			
			addChild(art);
			
			if (World.leveltype == 2)
			{
				var colortransform:ColorTransform = art.transform.colorTransform;
				colortransform.blueMultiplier = 0.5;
				colortransform.redMultiplier = 0.2;
				colortransform.greenMultiplier = 0.2;
				art.transform.colorTransform = colortransform;
			}
			
			art.gotoAndStop(1 + Math.floor(Math.random() * 14));
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