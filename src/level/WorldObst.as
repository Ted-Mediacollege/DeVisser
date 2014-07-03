package level
{
	import flash.display.MovieClip;
	import entities.EntityObstacle;
	
	/* De fish obstakels layer in het spel.
	 * 
	 * methods:
	 * updateTimer() zet de timer naar de nieuwe snelheid
	 * createObject(height) maakt nieuwe obstakels aan
	 * tick() maakt nieuwe obstakels aan, verplaast ze en verwijdert ze.
	 */
		
	public class WorldObst extends MovieClip
	{
		private var obstTimer:Number;
		public var OBST:Array;
		
		public function WorldObst() 
		{
			obstTimer = (240 / World.speed) / 2;
			OBST = new Array();
		}
		
		public function updateTimer(oldspeed:Number, newspeed:Number):void
		{
			var newtimer:int = obstTimer * oldspeed / newspeed;
			obstTimer = newtimer;
			
			for (var i:int = 0; i < OBST.length; i++ )
			{
				OBST[i].velX =  -(World.speed * 2.5);
			}
		}
		
		public function createObject(height:Number):void
		{
			var obst:EntityObstacle = new EntityObstacle(new ArtObst(), 1330 + (Math.random() * 60), height, -(World.speed * 2.5), 1.0 + Math.random() * 0.6); 
			OBST.push(obst);
			addChild(obst);
		}
		
		public function tick():void
		{
			obstTimer--;
			if (obstTimer < 0)
			{
				var obsts:int = 0;
				if (Math.floor(Math.random() * 3) == 0)
				{
					createObject(390);
					obsts++;
				}
				if (Math.floor(Math.random() * 3) == 0)
				{
					createObject(550);
					obsts++;
				}
				if (obsts < 2)
				{
					createObject(710);
				}
				
				obstTimer = 240 / World.speed;
			}
			
			for (var i:int = 0; i < OBST.length; i++ )
			{
				OBST[i].tick();
			}
			
			for (var j:int = 0; j < OBST.length; j++ )
			{
				if (OBST[j].x < -100)
				{
					removeChild(OBST[j]);
					OBST.splice(j, 1);
				}
			}
		}
	}
}