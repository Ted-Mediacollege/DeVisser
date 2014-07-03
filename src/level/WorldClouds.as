package level 
{
	import flash.display.MovieClip;
	import backgrounds.*;
	
	/* De cloud art layer in het spel.
	 * 
	 * methods:
	 * start() maakt wolken aan bij het begin van het spel.
	 * tick() maakt nieuwe wolken aan, verplaast ze en verwijdert ze.
	 */
	
	public class WorldClouds extends MovieClip
	{
		public var CLOUDS:Array;
		private var cloudeTimer:int;
		
		public function WorldClouds() 
		{
			CLOUDS = new Array();
			cloudeTimer = 0;
		}
		
		public function start():void 
		{
			var cloud1:BackgroundCloud = new BackgroundCloud(100 + (Math.random() * 200), 10 + (Math.random() * 80));
			CLOUDS.push(cloud1);
			addChildAt(cloud1, 0);
			var cloud2:BackgroundCloud = new BackgroundCloud(700 + (Math.random() * 200), 10 + (Math.random() * 80));
			CLOUDS.push(cloud2);
			addChildAt(cloud2, 1);
		}
		
		public function tick():void
		{
			cloudeTimer--;
			if (cloudeTimer < 0)
			{
				var cloud:BackgroundCloud = new BackgroundCloud(1350, 10 + (Math.random() * 80));
				CLOUDS.push(cloud);
				addChild(cloud);
				
				cloudeTimer = 3000;
			}
			
			for (var i:int = 0; i < CLOUDS.length; i++ )
			{
				CLOUDS[i].tick();
			}
			
			for (var l:int = 0; l < CLOUDS.length; l++ )
			{
				if (CLOUDS[l].x < -600)
				{
					removeChild(CLOUDS[l]);
					CLOUDS.splice(l, 1);
				}
			}
		}
	}
}