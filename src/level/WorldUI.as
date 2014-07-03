package level 
{
	import flash.display.MovieClip;
	import uis.*;
	
		
	/* De UI art layer in het spel.
	 * 
	 * methods:
	 * - start() maakt ui aan bij het begin van het spel
	 * - tick() update de ui
	 * - updatehealth() update de health art 
	 * - tickScoreText() update de score text
	 */
	
	public class WorldUI extends MovieClip
	{		
		public var SCORETEXT:Array = new Array();
		public var HEALTH:Array = new Array();
			
		public function WorldUI() 
		{
			SCORETEXT = new Array();
			HEALTH = new Array();
		}
		
		public function start():void 
		{
			for (var h:int = 0; h < 3; h++ )
			{
				var health:UiHealth = new UiHealth(1000 + (h * 80), 60);
				HEALTH.push(health);
				addChild(health);
			}
		}
		
		public function tick():void
		{
			tickScoreText();
		}	
		
		public function updateHealth():void
		{
			for (var h:int = 0; h < HEALTH.length; h++ )
			{
				if (h <= World.lives - 1)
				{
					HEALTH[h].setState(true);
				}
				else
				{					
					HEALTH[h].setState(false);
				}
			}
		}
		
		public function tickScoreText():void
		{
			for (var i:int = 0; i < SCORETEXT.length; i++ )
			{
				SCORETEXT[i].tick();
			}
			
			for (var j:int = 0; j < SCORETEXT.length; j++ )
			{
				if (SCORETEXT[j].done == true)
				{
					removeChild(SCORETEXT[j]);
					SCORETEXT.splice(j, 1);
				}
			}
		}
	}
}