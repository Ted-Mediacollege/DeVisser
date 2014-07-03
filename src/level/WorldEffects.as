package level 
{
	import flash.display.MovieClip;
	import effects.EffectBubble;
	
	/* De effect art layer in het spel.
	 * 
	 * methods:
	 * tick() maakt nieuwe effects aan, verplaast ze en verwijdert ze.
	 */
	
	public class WorldEffects extends MovieClip
	{		
		public var bubbletimer:int;
		public var BUBBLES:Array;
		
		public function WorldEffects() 
		{
			bubbletimer = 0;
			BUBBLES = new Array();
		}
		
		public function tick():void
		{
			bubbletimer--;
			if (bubbletimer < 0)
			{
				var bubble:EffectBubble = new EffectBubble(100 + Math.random() * 2100, 930);
				BUBBLES.push(bubble);
				addChild(bubble);
				bubbletimer = 30;
			}
			
			for (var i:int = 0; i < BUBBLES.length; i++ )
			{
				BUBBLES[i].tick();
			}
			
			for (var l:int = 0; l < BUBBLES.length; l++ )
			{
				if (BUBBLES[l].done == true)
				{
					removeChild(BUBBLES[l]);
					BUBBLES.splice(l, 1);
				}
			}
		}
	}
}