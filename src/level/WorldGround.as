package level 
{
	import flash.display.MovieClip;
	import backgrounds.BackgroundGround;
	
	/* De ground art layer in het spel.
	 * 
	 * methods:
	 * start() maakt ground aan bij het begin van het spel.
	 * tick() maakt nieuwe ground aan, verplaast ze en verwijdert ze.
	 */
	
	public class WorldGround extends MovieClip
	{
		public var GROUND1:Array;
		public var GROUND2:Array;
		private var ground1Timer:int;
		private var ground2Timer:int;
		
		public function WorldGround() 
		{
			GROUND1 = new Array();
			GROUND2 = new Array();
			ground1Timer = 0;
			ground2Timer = 0;
		}
		
		public function start():void 
		{
			var ground3:BackgroundGround = new BackgroundGround(new ArtGround2(), -1150, 580, 0.75);
			GROUND1.push(ground3);
			addChildAt(ground3, 0);
			var ground4:BackgroundGround = new BackgroundGround(new ArtGround2(), 100, 580, 0.75);
			GROUND2.push(ground4);
			addChildAt(ground4, 1);
			var ground1:BackgroundGround = new BackgroundGround(new ArtGround1(), -1150, 580, 1.5);
			GROUND1.push(ground1);
			addChildAt(ground1, 2);
			var ground2:BackgroundGround = new BackgroundGround(new ArtGround1(), 100, 580, 1.5);
			GROUND2.push(ground2);
			addChildAt(ground2, 3);
		}
		
		public function tick():void
		{			
			ground1Timer--;
			if (ground1Timer < 0)
			{
				var ground1:BackgroundGround = new BackgroundGround(new ArtGround1(), 1350, 580, 1.5);
				GROUND1.push(ground1);
				addChild(ground1);
				ground1Timer = 850;
			}
			
			ground2Timer--;
			if (ground2Timer < 0)
			{
				var ground2:BackgroundGround = new BackgroundGround(new ArtGround2(), 1350, 580, 0.75);
				GROUND2.push(ground2);
				addChildAt(ground2, 0);
				ground2Timer = 1700;
			}
			
			for (var i:int = 0; i < GROUND1.length; i++ )
			{
				GROUND1[i].tick();
			}
			
			for (var j:int = 0; j < GROUND2.length; j++ )
			{
				GROUND2[j].tick();
			}
			
			for (var k:int = 0; k < GROUND1.length; k++ )
			{
				if (GROUND1[k].x < -1300)
				{
					removeChild(GROUND1[k]);
					GROUND1.splice(k, 1);
				}
			}
			
			for (var l:int = 0; l < GROUND2.length; l++ )
			{
				if (GROUND2[l].x < -1300)
				{
					removeChild(GROUND2[l]);
					GROUND2.splice(l, 1);
				}
			}
		}
	}
}