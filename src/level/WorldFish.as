package level 
{
	import entities.EntityPickup;
	import flash.display.MovieClip;
	import entities.EntityFish;
	
	/* De fish art layer in het spel.
	 * 
	 * methods:
	 * updateTimer() zet de timer naar de nieuwe snelheid
	 * createObject(height) maakt nieuwe vis of pickups aan
	 * tick() maakt nieuwe vissen aan, verplaast ze en verwijdert ze.
	 */
		
	public class WorldFish extends MovieClip
	{
		private var pickupcountdown:int;
		private var fishTimer:Number;
		public var FISH:Array;
		public var scoreList:Array = new Array(100, 130, 160, 190, 180, 170, 150, 140, 120, 110, 90, 120, 140, 150);
		
		public function WorldFish() 
		{
			pickupcountdown = 9;
			fishTimer = 0;
			FISH = new Array();
		}
		
		public function updateTimer(oldspeed:Number, newspeed:Number):void
		{
			var newtimer:int = fishTimer * oldspeed / newspeed;
			fishTimer = newtimer;
			
			for (var i:int = 0; i < FISH.length; i++ )
			{
				FISH[i].velX =  -(World.speed * 2.5);
			}
		}
		
		public function createObject(height:Number):void
		{
			pickupcountdown--;
			if (pickupcountdown < 0)
			{
				var pickup:EntityPickup = new EntityPickup(1320 + (Math.random() * 60), height, -(World.speed * 2.5), 1.0 + Math.random() * 0.6); 
				FISH.push(pickup);
				addChild(pickup);
				pickupcountdown = 9;
			}
			else
			{
				var rand:int = Math.floor(Math.random() * 14);
				var fish:EntityFish = new EntityFish(new ArtFish(), 1320 + (Math.random() * 60), height, -(World.speed * 2.5), 1.0 + Math.random() * 0.6, 1 + rand, scoreList[rand]); 
				FISH.push(fish);
				addChild(fish);
			}
		}
		
		public function tick():void
		{
			fishTimer--;
			if (fishTimer < 0)
			{
				var notspawned:Boolean = true;
				if (Math.floor(Math.random() * 3) == 0 && notspawned)
				{
					createObject(360);
					notspawned = false;
				}
				if (Math.floor(Math.random() * 3) == 0 && notspawned)
				{
					createObject(520);
					notspawned = false;
				}
				if (notspawned)
				{
					createObject(680);
				}
				
				fishTimer = 240 / World.speed;
			}
			
			for (var i:int = 0; i < FISH.length; i++ )
			{
				FISH[i].tick();
			}
			
			for (var j:int = 0; j < FISH.length; j++ )
			{
				if (FISH[j].x < -100)
				{
					removeChild(FISH[j]);
					FISH.splice(j, 1);
				}
			}	
		}
	}
}