package guis 
{
	import flash.display.MovieClip;
	import level.World;
	import achievements.AchievementCheck;
	import sounds.SoundPlayer;
	import sounds.SoundList;
	
	public class GuiIngame extends Gui 
	{		
		public var main:Main;
		public var playing:Boolean;
		public var world:World;
		public var pauseScreen:GuiPauseScreen; 
		public var pauseText:GuiText;
		public var button_menu:GuiButton;
		public var button_resume:GuiButton;
		public var text_info:GuiText;
		
		public function GuiIngame(m:Main, p:int, b:int, d:int, t:int) 
		{	
			main = m;
			startWorld(p, b, d, t);
			
			SoundPlayer.switchBackgroundMusic(SoundList.list_music[2]);
				
			AchievementCheck.boatCheck(p, b, d);
			
			pauseScreen = new GuiPauseScreen();
			pauseText = new GuiText("Pauze", 640, 300, 400, 52, "center", 0xFFFFFF);
			button_menu = new GuiButton(0, new ArtButtonPause_Menu, 640, 420, -164, -49, 328, 98);
			button_resume = new GuiButton(1, new ArtButtonPause_Cont, 640, 540, -164, -49, 328, 98);
			text_info = new GuiText("", 570, 2, 700, 30, "right", 0xFFFFFF);
			text_info.update("Score: 1234567890    Geld: 1234567890");
			
			buttonlist.push(button_menu);
			buttonlist.push(button_resume);
			
			addChild(text_info);
			addChild(pauseScreen);
			addChild(pauseText);
			addChild(button_menu);
			addChild(button_resume);
		
			pauseScreen.draw(false);
			pauseText.alpha = 0;
			button_menu.alpha = 0;
			button_resume.alpha = 0;
			button_menu.setEnabled(false);
			button_resume.setEnabled(false);
		}	
		
		override public function tick(keyinput:Array):void
		{	
			if (playing)
			{
				world.tick(keyinput[0]);
				text_info.update("Score: " + World.score + "    Geld: " + World.coins);
			}
		}
		
		override public function action(id:int):void
		{
			if (id == 0)
			{
				removeChild(world);
				world = null;
				main.switchGui(true, new GuiMenu(main));
			}
			if (id == 1)
			{
				SoundPlayer.switchBackgroundMusic(SoundList.list_music[2]);
				playing = true;
				pauseScreen.draw(false);
				pauseText.alpha = 0;
				button_menu.alpha = 0;
				button_resume.alpha = 0;
				button_menu.setEnabled(false);
				button_resume.setEnabled(false);
			}
		}
		
		override public function unFocus():void
		{
			SoundPlayer.switchBackgroundMusic(SoundList.list_music[0]);
			playing = false;
			pauseScreen.draw(true);
			pauseText.alpha = 1;
			button_menu.alpha = 1;
			button_resume.alpha = 1;
			button_menu.setEnabled(true);
			button_resume.setEnabled(true);
		}
		
		override public function esc():void
		{
			if (playing)
			{
				SoundPlayer.switchBackgroundMusic(SoundList.list_music[0]);
				playing = false;
				pauseScreen.draw(true);
				pauseText.alpha = 1;
				button_menu.alpha = 1;
				button_resume.alpha = 1;
				button_menu.setEnabled(true);
				button_resume.setEnabled(true);
			}
			else
			{
				SoundPlayer.switchBackgroundMusic(SoundList.list_music[2]);
				playing = true;
				pauseScreen.draw(false);
				pauseText.alpha = 0;
				button_menu.alpha = 0;
				button_resume.alpha = 0;
				button_menu.setEnabled(false);
				button_resume.setEnabled(false);
			}
		}

		public function startWorld(p:int, b:int, d:int, t:int):void
		{
			playing = true;
			world = new World(this);
			addChild(world);
			world.create(d, t);
			world.start(p, b);
		}
		
		public function death(d:int, s:int, c:int):void
		{
			removeChild(world);
			world = null;
			SoundPlayer.switchBackgroundMusic(SoundList.list_music[0]);
			main.switchGui(true, new GuiGameOver(main, d, s, c));
		}
	}
}