package 
{
	import achievements.AchievementPopup;
	import data.SaveData;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import guis.Gui;
	import guis.GuiButton;
	import guis.GuiIntro;
	import guis.GuiMenu;
	import guis.GuiGameOver;
	import level.World;
	import flash.automation.KeyboardAutomationAction;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import data.DataGame;
	import flash.system.Security;
	import achievements.AchievementCheck;
	import sounds.SoundList;
	import sounds.SoundPlayer;
	import flash.system.Capabilities;
	
	/* ===========================================================
	 * =BBBBB===BBBBB====B=====B==B==BBBBB==BBBBB==BBBBB==BBBBB===
	 * =B====B==B========B=====B==B==B======B======B======B====B==
	 * =B====B==BBB=======B===B===B==BBBBB==BBBBB==BBB====BBBBB===
	 * =B====B==B==========B=B====B======B======B==B======B====B==
	 * =BBBBB===BBBBB=======B=====B==BBBBB==BBBBB==BBBBB==B====B==
	 * ===========================================================
	 * =========                                         =========
	 * ======              Spel: De Visser                  ======
	 * ===                 gemaakt in mei/juni 2013            ===
	 * ==                                                       ==
	 * =                   Lead programmer:                      =
	 * =                   - ted de vos                          =
	 * =                                                         =
	 * =                   Lead Artist:                          =
	 * =                   - Thomas Schrama                      =
	 * =                                                         =
	 * =                   Artists:                              =
	 * =                   - Joeri Weidmann                      =
	 * =                   - Michael Rinsma                      =
	 * =                   - Dianta Groot                        =
	 * =                                                         =
	 * =                   Testers:                              =
	 * ==                  - Justin                             ==
	 * ===                 - Danny                             ===
	 * ======              - Dylan                          ======
	 * =========                                         =========
	 * ===========================================================
	 */
	
	 
	/* De main Class van de game
	 * 
	 * Main wordt mee gegeven aan een gui waneer swichgui wordt aangeroepen
	 * 
	 * methods:
	 * - onKeyReleased(KeyboardEvent) Wordt aangeroepen waneer een key gereleased wordt
	 * - onKeyPressed(KeyboardEvent) Wordt aangeroepen waneer een key wordt ingedrukt
	 * - onMouseMove(MouseEvent) Wordt aangeroepen waneer de muis beweegt
	 * - onMouseDown(MouseEvent) Wordt aangeroepen waneer de muis wordt ingedrukt
	 * - onMouseScroll(MouseEvent) Wordt aangeroepen waneer de muis scrolt
	 * - unFocus(Event) Wordt aangeroepen waneer het scherm de focus verliest
	 * 
	 * eigenschappen:
	 * - savedata: Class waar alle savedata wordt geladden en opgeslagen
	 * - gui: De gui de wordt weergeven
	 * - keyInput: Array met alle key data
	 * - mousereleased: Of de muis wordt ingedrukt of niet
	 * - usemask: of de mask gebruikt moet worden
	 * - framemask: de mask
	 * - database: de link naar de database met alle online highscore
	 * - network: of network gebruikt mag worden
	 * - saving: of saving gebruikt mag worden
	 * - secondTimer: telt elke seconde (1 seconde / 60 ticks)
	 * - saveTimer: savetimer (15 seconde / 60 * 15 ticks)
	 * - achievementpopup: achievement popup movieclip
	 * - inputfield: of er gefocust is op een inputfield
	 */

	public class Main extends MovieClip 
	{
		[Embed(source="../lib/GROBOLD.ttf", fontFamily="costumFont", embedAsCFF="false")]
		public var customfont:String;
		
		public var savedata:SaveData = new SaveData();
		public static var gui:Gui;
		public var keyInput:Array = new Array(false, false, false);
		public var mousereleased:Boolean = true;
		private var usemask:Boolean = true;
		private var frameMask:Shape = new Shape();
		public static var database:String = "http://14169.hosts.ma-cloud.nl/devisser/index.php";
		public static var network:Boolean = true;
		public static var saving:Boolean = true;
		public static var isMac:Boolean = false;
		public var secondTimer:int = 60;
		public var saveTimer:int = 15;
		public var achievementpopup:AchievementPopup;
		
		public function Main()
		{	
			SoundPlayer.startBackgroundMusic(SoundList.list_music[0]);
			
			/*if((Capabilities.os.indexOf("Mac") >= 0))
			{
				isMac = true;
				network = false;
			}
			else
			{*/
				Security.loadPolicyFile("http://14169.hosts.ma-cloud.nl/devisser/crossdomain.xml");
				Security.allowDomain(database);
			//}
			
			if (usemask)
			{
				frameMask.graphics.beginFill(0x000000);
				frameMask.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
				frameMask.graphics.endFill();
				addChild(frameMask);
				this.mask = frameMask;
			}
			
			if (saving)
			{
				SaveData.load();
			}
			else
			{
				SaveData.reset();
			}
			
			switchGui(false, new GuiIntro(this));
			
			achievementpopup = new AchievementPopup();
			addChild(achievementpopup);
			 
			addEventListener(Event.ENTER_FRAME, tick); 
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseScroll);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
			stage.addEventListener(Event.DEACTIVATE, unFocus);
		}
		
		public function switchGui(oldGui:Boolean, newGui:Gui):void
		{
			if (oldGui)
			{
				removeChild(gui);
			}
			gui = null;
			
			if(newGui != null)
			{
				gui = newGui;
				addChildAt(newGui, 0);
				gui.guiInit();
			}
		}
		
		public function tick(e:Event):void
		{	
			if (gui != null)
			{
				gui.tick(keyInput);
			}
			
			secondTimer--;
			if (secondTimer < 0)
			{
				DataGame.playtime++;
				secondTimer = 60;
				AchievementCheck.timeCheck();
				
				saveTimer--;
				if (saveTimer < 0)
				{
					if (saving)
					{
						SaveData.save();
					}
					saveTimer = 15;
				}
			}
			
			achievementpopup.tick();
		}
		
		private function onKeyReleased(e:KeyboardEvent):void
		{
			if (e.keyCode == 32)
			{
				keyInput[0] = false;
			}
			if (e.keyCode == 13)
			{
				keyInput[1] = false;
			}
		}
		
		private function onKeyPressed(e:KeyboardEvent):void
		{
			if (e.keyCode == 32)
			{
				keyInput[0] = true;
			}
			if (e.keyCode == 13)
			{
				keyInput[1] = true;
			}
			if (e.keyCode == 27)
			{
				if (gui != null)
				{
					gui.esc();
				}
			}
		}
		
		private function onMouseMove(e:MouseEvent):void
		{
			if (gui != null)
			{
				for (var i:int = 0; i < gui.buttonlist.length; i++ )
				{
					if (stage.mouseX > gui.buttonlist[i].posX + gui.buttonlist[i].detectionX1 &&
						stage.mouseY > gui.buttonlist[i].posY + gui.buttonlist[i].detectionY1 && 
						stage.mouseX < gui.buttonlist[i].posX + gui.buttonlist[i].detectionX1 + gui.buttonlist[i].detectionX2 && 
						stage.mouseY < gui.buttonlist[i].posY + gui.buttonlist[i].detectionY1 + gui.buttonlist[i].detectionY2 )
					{
						gui.buttonlist[i].setHover(true);
					}
					else
					{
						gui.buttonlist[i].setHover(false);
					}
				}
			}
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			if (gui != null)
			{
				for (var i:int = 0; i < gui.buttonlist.length; i++ )
				{
					if (stage.mouseX > gui.buttonlist[i].posX + gui.buttonlist[i].detectionX1 &&
						stage.mouseY > gui.buttonlist[i].posY + gui.buttonlist[i].detectionY1 && 
						stage.mouseX < gui.buttonlist[i].posX + gui.buttonlist[i].detectionX1 + gui.buttonlist[i].detectionX2 && 
						stage.mouseY < gui.buttonlist[i].posY + gui.buttonlist[i].detectionY1 + gui.buttonlist[i].detectionY2 &&
						gui.buttonlist[i].buttonenabled)
					{
						SoundPlayer.playSoundEffect(SoundList.list_sounds[3]);
						gui.action(gui.buttonlist[i].id);
						break;
					}
				}
			}
		}
		
		private function onMouseScroll(e:MouseEvent):void
		{
			gui.scroll(e.delta);
		}
		
		private function unFocus(e:Event):void
		{
			gui.unFocus();
		}
	}
}
