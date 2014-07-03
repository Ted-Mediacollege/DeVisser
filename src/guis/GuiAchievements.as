package guis 
{
	import flash.display.MovieClip;
	import achievements.AchievementList;
	
	public class GuiAchievements extends Gui 
	{		
		public var main:Main;
		
		private var scrollMin:int = 0;
		private var scrollCur:int = 0;
		private var scrollMax:int = -1560;
		
		public var background1:GuiArt;
		public var background2:GuiArt;
		public var background3:GuiArt;
		public var ACHIEVEMENTS:Array;
		
		public var button_menu:GuiButton;
		public var text_title:GuiText;
		
		public var scrollFrame:GuiArt;
		public var scrollButton:GuiArt;
		public var scrollposY:Number = 0; 
		
		public function GuiAchievements(m:Main) 
		{
			main = m;
		}	
				
		override public function guiInit():void
		{
			background1 = new GuiArt(new ArtGuiBackgroundTrophie(), 0, 0, 1, 1);
			background2 = new GuiArt(new ArtGuiBackgroundTrophie2(), 0, 0, 1, 1);
			background3 = new GuiArt(new ArtGuiBackgroundTrophie3(), 0, 0, 1, 1);
			scrollFrame = new GuiArt(new ArtGuiBackgroundScrollFrame(), 980, 478, 1, 0.9);
			scrollButton = new GuiArt(new ArtGuiBackgroundScrollButton(), 980, 500, 1, 1);
			button_menu = new GuiButton(0, new ArtButtonPause_Menu(), 655, 840, -164, -49, 328, 98);
			text_title = new GuiText("Trofeeën", 650, 30, 400, 80, "center", 0xDBB188);
			
			buttonlist.push(button_menu);
			
			addChild(background1);
			
			ACHIEVEMENTS = new Array();
			for (var i:int = 0; i < AchievementList.list.length; i++ )
			{
				var achiev:GuiAchievementsItem = new GuiAchievementsItem(AchievementList.list[i].done, 325, 136 + (90 * i), AchievementList.list[i].icon, AchievementList.list[i].name, AchievementList.list[i].task);
				addChild(achiev);
				ACHIEVEMENTS.push(achiev);
			}
			
			addChild(background2);
			addChild(background3);
			addChild(scrollFrame);
			addChild(scrollButton);
			addChild(button_menu);
			addChild(text_title);
		}
		
		override public function action(id:int):void
		{	
			if (id == 0)
			{
				main.switchGui(true, new GuiMenu(main));
			}
		}
		
		override public function scroll(dir:int):void 
		{
			scrollCur += dir * 32;
			if (scrollCur > scrollMin) 
			{
				scrollCur = scrollMin;
			}
			if (scrollCur < scrollMax) 
			{
				scrollCur = scrollMax;
			}
			
			scrollposY = scrollCur / 3.2;
		}
		
		override public function tick(keyinput:Array):void
		{
			scrollButton.y = 235 + -scrollposY;
			
			for (var i:int = 0; i < ACHIEVEMENTS.length; i++ )
			{
				ACHIEVEMENTS[i].y = ACHIEVEMENTS[i].baseY + scrollCur;
			}
		}
	}
}