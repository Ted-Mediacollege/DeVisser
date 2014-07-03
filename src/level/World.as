package level
{
	import backgrounds.*;
	import effects.TextScore;
	import entities.*;
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import guis.GuiIngame;
	import uis.UiHealth;
	import guis.GuiGameOver;
	import data.DataGame;
	import achievements.AchievementCheck;
	import sounds.SoundList;
	import sounds.SoundPlayer;
	
	/* De class waar alles in het spel geregeld wordt.
	 * zoals: spawnen, updaten en statestieken bijhouden.
	 * 
	 * methods:
	 * - create(int, int) maakt alle arrays en world classes aan
	 * - tick(Boolean) update alle objecten in het spel
	 * - updatelevel() kijkt of de snelheid omhoog kan
	 * - updateTimers(Number, Number) update alle spawn timers met de nieuwe snelheid
	 * - hookCheck() loopt door alle vissen en obstakels om te kijken of ze de haak raken
	 * - start(int, int) spawnt alle objecten aan het begin van het spel.
	 */
	
	public class World extends MovieClip
	{		
		public var gui:GuiIngame;
		
		public static var waves:WorldWaves;
		public static var clouds:WorldClouds;
		public static var ground:WorldGround;
		public static var fish:WorldFish;
		public static var obst:WorldObst;
		public static var effect:WorldEffects;
		public static var ui:WorldUI;
		
		public static var boat:EntityBoat;
		public static var player:EntityPlayer;
		public static var hook:EntityHook;
		public var fishline:EntityFishLine;
		public var sky:BackgroundAir;
		
		public static var leveltype:int;
		public static var score:int;
		public static var coins:int;
		public static var lives:int;
		public static var difficulty:int;
		public static var speed:Number = 1;
		
		public static var levelid:int = 0;
		public static var levelTimer:int = 60 * 4;
		
		private var mainTick:int = 0;
		
		public function World(g:GuiIngame) 
		{
			gui = g;
		}
		
		public function create(d:int, t:int):void
		{
			leveltype = t;
			score = 0;
			coins = 0;
			
			difficulty = d;
			if (d == 1)
			{
				speed = 1.3;
			}
			else if (d == 2)
			{
				speed = 2;
			}
			else 
			{
				speed = 2.7;
			}
			
			waves = new WorldWaves();
			clouds = new WorldClouds();
			ground = new WorldGround();
			fish = new WorldFish();
			obst = new WorldObst();
			effect = new WorldEffects();
			ui = new WorldUI();
		}
		
		public function tick(spacebutton:Boolean):void
		{
			updatelevel();
			boat.tick();
			player.tick();
			hook.tick(spacebutton);
			fishline.draw();
			waves.tick();
			ground.tick();
			clouds.tick();
			fish.tick();
			obst.tick();
			hookCheck();
			effect.tick();
			ui.tick();
		}
		
		public function updatelevel():void
		{
			levelTimer--;
			if (levelTimer < 0)
			{
				var oldspeed:Number = speed;
				var allowed:Boolean = false;
				
				if (difficulty == 1 && levelid < 25) { allowed = true; }
				if (difficulty == 2 && levelid < 22) { allowed = true; }
				if (difficulty == 3 && levelid < 19) { allowed = true; }
				
				if (allowed)
				{
					levelid++;
					speed += 0.1;
					levelTimer = 60 * 4;
					updateTimers(oldspeed, speed);
				}
			}
		}
		
		public function updateTimers(oldspeed:Number, newspeed:Number):void
		{
			fish.updateTimer(oldspeed, newspeed);
			obst.updateTimer(oldspeed, newspeed);
		}
		
		public function hookCheck():void
		{
			for (var i:int = 0; i < fish.FISH.length; i++)
			{
				for (var k:int = 0; k < hook.hitArrayX.length; k++)
				{
					if (fish.FISH[i].hitTestPoint(hook.hitArrayX[k] + hook.x, hook.hitArrayY[k] + hook.y, true))
					{
						if (fish.FISH[i].isPickup)
						{
							fish.FISH[i].onPickup();
							ui.updateHealth();
						}
						else
						{
							var fishscore:int = fish.FISH[i].fishscore + ((fish.FISH[i].fishscore / 5) * (difficulty - 1)) + ((fish.FISH[i].fishscore / 10) * levelid);
							score += fishscore;
							DataGame.fishcought++;
							AchievementCheck.checkFish();
							coins += 10 + (2 * (difficulty - 1)) + (1 * levelid);						
							var scoretext1:TextScore = new TextScore(fishscore, hook.hitArrayX[k] + hook.x, hook.hitArrayY[k] + hook.y - 20, -(speed * 2.5), 0);
							ui.SCORETEXT.push(scoretext1);
							ui.addChild(scoretext1);
						}
						SoundPlayer.playSoundEffect(SoundList.list_sounds[2]);
						fish.removeChild(fish.FISH[i]);
						fish.FISH.splice(i, 1);
						break;
					}
				}
			}
			
			var death:Boolean = false;
			for (var j:int = 0; j < obst.OBST.length; j++)
			{
				for (var l:int = 0; l < hook.hitArrayX.length; l++)
				{
					if (obst.OBST[j].hitTestPoint(hook.hitArrayX[l] + hook.x, hook.hitArrayY[l] + hook.y, true))
					{
						lives--;
						score -= 100;
						SoundPlayer.playSoundEffect(SoundList.list_sounds[2]);
						var scoretext2:TextScore = new TextScore(-10, hook.hitArrayX[l] + hook.x, hook.hitArrayY[l] + hook.y - 20, -(speed * 2.5), 0);
						ui.SCORETEXT.push(scoretext2);
						ui.addChild(scoretext2);
						if (lives < 1)
						{
							death = true;
						}
						ui.updateHealth();
						obst.removeChild(obst.OBST[j]);
						obst.OBST.splice(j, 1);
						break;
					}
				}
			}
			
			if (death)
			{
				gui.death(difficulty, score, coins);
			}
		}
		
		public function start(p:int, b:int):void
		{
			score = 0;
			lives = 3;
			levelid = 0;
			
			sky = new BackgroundAir(0, 0);
			clouds.start();
			waves.start();
			ground.start();
			ui.start();
			 
			boat = null; //fix for strange bug
			boat = new EntityBoat(b, 100, 40, 40, -0.3725);
			player = new EntityPlayer(b, p);
			fishline = new EntityFishLine(p);
			hook = new EntityHook(new ArtHook(), 20, p);
			
			addChildAt(sky, 0);
			addChildAt(clouds, 1);
			addChildAt(waves, 2);
			addChildAt(ground, 3);
			addChildAt(fish, 4);
			addChildAt(obst, 5);
			addChildAt(effect, 6);
			addChildAt(player, 7);
			addChildAt(boat, 8);
			addChildAt(fishline, 9);
			addChildAt(hook, 10);
			addChildAt(ui, 11);
		}
	}
}