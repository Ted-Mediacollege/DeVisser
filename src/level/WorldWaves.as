package level 
{
	import flash.display.MovieClip;
	import backgrounds.*;
	
	/* De waves art layer in het spel.
	 * 
	 * methods:
	 * start() maakt waves aan bij het begin van het spel.
	 * tick() maakt nieuwe waves aan, verplaast ze en verwijdert ze.
	 */
	
	public class WorldWaves extends MovieClip
	{
		public var WAVES:Array;
		private var waveTimer:int; 
		
		public function WorldWaves() 
		{
			WAVES = new Array();
			waveTimer = 0; 
		}
		
		public function start():void 
		{
			var newWaveTop1:BackgroundWaveTop = new BackgroundWaveTop(-520, 251);
			WAVES.push(newWaveTop1);
			addChildAt(newWaveTop1, 0);
			var newWaveBase1:BackgroundWaveBase = new BackgroundWaveBase(-520, 280);
			WAVES.push(newWaveBase1);
			addChildAt(newWaveBase1, 1);
			var newWaveTop2:BackgroundWaveTop = new BackgroundWaveTop(60, 251);
			WAVES.push(newWaveTop2);
			addChildAt(newWaveTop2, 2);
			var newWaveBase2:BackgroundWaveBase = new BackgroundWaveBase(60, 280);
			WAVES.push(newWaveBase2);
			addChildAt(newWaveBase2, 3);
			var newWaveTop3:BackgroundWaveTop = new BackgroundWaveTop(680, 251);
			WAVES.push(newWaveTop3);
			addChildAt(newWaveTop3, 4);
			var newWaveBase3:BackgroundWaveBase = new BackgroundWaveBase(680, 280);
			WAVES.push(newWaveBase3);
			addChildAt(newWaveBase3, 5);
		}
		
		public function tick():void
		{			
			waveTimer--;
			if (waveTimer < 0)
			{
				var newWaveTop:BackgroundWaveTop = new BackgroundWaveTop(1300, 251);
				WAVES.push(newWaveTop);
				addChild(newWaveTop);
				
				var newWaveBase:BackgroundWaveBase = new BackgroundWaveBase(1300, 280);
				WAVES.push(newWaveBase);
				addChild(newWaveBase);
				
				waveTimer = 410;
			}
			
			for (var i:int = 0; i < WAVES.length; i++ )
			{
				WAVES[i].tick();
			}
			
			for (var j:int = 0; j < WAVES.length; j++ )
			{
				if (WAVES[j].x < -700)
				{
					removeChild(WAVES[j]);
					WAVES.splice(j, 1);
				}
			}
		}
	}
}