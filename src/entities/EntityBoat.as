package entities 
{
	import flash.display.MovieClip;
	import data.DataGame;
	import flash.geom.ColorTransform;
	import level.World;
	
	/* De boot in het spel.
	 * 
	 * methods:
	 * - reset() wordt aangeroepen als de boot weer op zn begin positie moet staan
	 * - tick() wordt elke frame aangeroepen
	 * 
	 * eigenschappen:
	 * - velY: de y-velocity van de boot
	 * - baseY: het middelpunt waar de boot omheen slingert
	 * - startVelY: de y-velocity toen de entitie werdt aangemaakt
	 * - startY: de y-positie toen de entitie werdt aangemaakt
	 * - timer: de timer die steeds de velocity en y-pos reset
	 * - art: de movieclip van de entiteit
	 */
	
	public class EntityBoat extends Entity
	{
		public var velY:Number;
		public var baseY:Number;
		public var startVelY:Number;
		public var startY:Number;
		public var timer:int;
		
		public function EntityBoat(b:int, px:Number, py:Number, by:Number, vy:Number) 
		{
			art = DataGame.boats[b].art;
			addChild(art);
			
			x = px;
			y = py;
			
			velY = vy;
			startVelY = 0;
			startY = 20;
			baseY = by;
			
			timer = 324;
			
			if (World.leveltype == 2)
			{
				var colortransform:ColorTransform = art.transform.colorTransform;
				colortransform.blueMultiplier = 0.5;
				colortransform.redMultiplier = 0.2;
				colortransform.greenMultiplier = 0.2;
				art.transform.colorTransform = colortransform;
			}
			else
			{
				var colortransform2:ColorTransform = art.transform.colorTransform;
				colortransform2.blueMultiplier = 1.0;
				colortransform2.redMultiplier = 1.0;
				colortransform2.greenMultiplier = 1.0;
				art.transform.colorTransform = colortransform2;
			}
		}	
		
		public function setFrame(f:int):void
		{
		}
		
		public function tick():void
		{
			timer++;
			if (timer > 410)
			{
				reset();
			}
			
			if (y > baseY)
			{
				velY -= 0.00375;
				//velY -= 0.015;
			}
			else
			{
				velY += 0.00375;
				//velY += 0.015;
			}
			
			y += velY;
		}
		
		public function reset():void
		{
			timer = 0;
			velY = startVelY;
			y = startY;
		}
	}
}