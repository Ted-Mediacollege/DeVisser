package achievements 
{
	import flash.display.MovieClip;
	import guis.GuiArt;
	import guis.GuiText;
	
	/*
	 * De achievement popup die rechts 
	 * boven in beeld komt waneer er
	 * een achievement is behaald.
	 * 
	 * Nieuwe popups worden toegevoegd
	 * aan de QUEUE array met deze functie:
	 * addToQueue(icon, name, task)
	 * 
	 * Elk frame wordt er gekeken of er
	 * iets in de queue zit, zoja dan 
	 * wordt de achievement uit de queue
	 * gehaald en wordt de popup gestart
	 * 
	 * methods:
	 * - tick() wordt elke frame aangeroepen
	 * - addToQueue(int, String, String) voegt nieuwe achievement data aan de queue toe
	 */
	
	public class AchievementPopup extends MovieClip
	{		
		public static var QUEUE:Array;
		
		public var frame:GuiArt;
		public var icon:GuiArt;
		public var text_titel:GuiText;
		public var text_naam:GuiText;
		
		public var onscreen:Boolean;
		public var id:int;
		public var achievnaam:String;
		public var task:String;
		public var timer:Number;
		public var state:Boolean;
		
		public function AchievementPopup() 
		{
			QUEUE = new Array();
			
			frame = new GuiArt(new ArtGuiBackgroundTrophieFrame(), 950 + 160, 80, 1, 1);
			icon = new GuiArt(new ArtTrophies(), 840 + 60, 150, 0.3, 0.3);
			text_titel = new GuiText("Nieuwe trofee!", 840 + 120, 20, 400, 36, "left", 0xFFFFFF);
			text_naam = new GuiText("trofeee naam", 840 + 120, 80, 400, 24, "left", 0xFFFFFF);
			
			addChild(frame);
			addChild(icon);
			addChild(text_titel);
			addChild(text_naam);
			
			onscreen = false;
			
			y = -170;
		}	
		
		public function tick():void
		{
			if (onscreen)
			{
				if (state)
				{
					timer++;
					if (timer < 85)
					{
						y+=2;
					}
					if (timer > 150)
					{
						state = false;
					}
				}
				else
				{
					timer--;
					if (timer < 85)
					{
						y-=2;
					}
					if (timer < 1)
					{
						onscreen = false;
					}
				}
			}
			else if(QUEUE.length > 1)
			{
				id = QUEUE.shift();
				achievnaam = QUEUE.shift();
				
				icon.setFrame(id);
				text_naam.update(achievnaam);
				onscreen = true;
				timer = 0;
				state = true;
			}
		}
		
		public static function addToQueue(i:int, n:String, t:String):void
		{
			QUEUE.push(i);
			QUEUE.push(n);
		}
	}
}