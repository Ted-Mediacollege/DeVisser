package entities 
{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import level.World;
	
	/* Alle objecten in het spel
	 * 
	 * methods:
	 * - tick() wordt elke frame aangeroepen.
	 * - onPickup() wordt aangeroepen waneer haak pickup raakt
	 * 
	 * parameters:
	 * - px: de x-positie van de pickup
	 * - py: de y-postite van de pickup
	 * - vx: de x-velocity van de pickup
	 * - vy: de y-velocity van de pickup
	 * 
	 * eigenschappen:
	 * - art: de movieclip van de entiteit
	 * - velX: de x-velocity van het object
	 * - velY: de y-velocity van het object
 	 * - baseY: de y positie waar het object omheen slingert
	 * - isPickup: geeft aan of het een pickup is
	 */
	
	public class EntityPickup extends EntityObject
	{		
		public function EntityPickup(px:Number, py:Number, vx:Number, vy:Number) 
		{
			art = new ArtPickupWorm();
			velX = vx;
			velY = vy;
			x = px;
			y = py;
			baseY = py;
			addChild(art);
			isPickup = true;
			
			if (World.leveltype == 2)
			{
				var colortransform:ColorTransform = art.transform.colorTransform;
				colortransform.blueMultiplier = 0.5;
				colortransform.redMultiplier = 0.2;
				colortransform.greenMultiplier = 0.2;
				art.transform.colorTransform = colortransform;
			}
		}	
		
		public function onPickup():void
		{
			if (World.lives < 3)
			{
				World.lives++;
			}
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