package effects 
{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import level.World;
	
	/* Effect movieclips
	 * 
	 * effect wordt verwijdert waneer done op true staat.
	 * 
	 * methods:
	 * tick() wordt elke frame aangeroepen
	 * 
	 * parameters:
	 * - px: de x-positie van het effect
	 * - py: de y-positie van het effect
	 * 
	 * eigenschappen:
	 * - velX: de x-velocity van het effect
	 * - velY: de y-velocity van het effect
	 * - art: de art van de movieclip
	 * - done: is de effect klaar met afspelen
	 * - anim: is de animatie aan het afspelen
	 * - cframe: bij welke frame de animatie is
	 * - mframe: maximaal aantal frames in de animatie
	 */
	
	public class EffectBubble extends Effect 
	{
		public var anim:Boolean = false;
		public var cframe:int = 0;
		public var mframe:int = 5;
		
		public function EffectBubble(px:int, py:int) 
		{
			art = new ArtBubble();
			addChild(art);
			done = false;
			x = px;
			y = py;
			velX = -2.5;
			velY = -1.5;
			anim = false;
			art.gotoAndStop(1);
			art.alpha = 0.5;
			
			if (World.leveltype == 2)
			{
				var colortransform:ColorTransform = art.transform.colorTransform;
				colortransform.blueMultiplier = 0.5;
				colortransform.redMultiplier = 0.2;
				colortransform.greenMultiplier = 0.2;
				art.transform.colorTransform = colortransform;
			}
		}	
		
		override public function tick():void
		{
			x += velX;
			y += velY;
			
			if (y < 350)
			{
				anim = true;
			}
			
			if (anim)
			{
				if (cframe >= mframe)
				{
					done = true;
				}
				else
				{
					cframe++;
					art.gotoAndStop(cframe + 1);
				}
			}
		}
	}
}