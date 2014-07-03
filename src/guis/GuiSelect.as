package guis 
{
	import entities.EntityBoat;
	import entities.EntityPlayer;
	import data.DataGame;
	import flash.display.MovieClip;
	import data.PlayerAndBoatPositions;
	import flash.geom.ColorTransform;
	
	public class GuiSelect extends Gui
	{
		private var main:Main;
		
		public var button_Play:GuiButton;
		public var button_Boat_Left:GuiButton;
		public var button_Boat_Right:GuiButton;
		public var button_Player_Left:GuiButton;
		public var button_Player_Right:GuiButton;
		public var button_Level_Left:GuiButton;
		public var button_Level_Right:GuiButton;
		public var button_Diff:GuiButtonSelect;
		public var text_level:GuiText;
		
		public var background:GuiArt;
		public var boat:GuiArt;
		public var player:GuiArt;
		
		private var boatselected:int;
		private var playerselected:int;
		private var difficulty:int = 1;
		private var leveltype:int = 1;
		
		public function GuiSelect(m:Main) 
		{
			main = m;
		}	
		
		override public function guiInit():void
		{
			button_Play = new GuiButton(0, new ArtButtonSelect_Start(), 750, 780, -99.5, -41, 199, 82);
			button_Boat_Left = new GuiButton(1, new ArtButtonSelect_ArrowL(), 300, 420, 0, 0, 55, 55);
			button_Boat_Right = new GuiButton(2, new ArtButtonSelect_ArrowR(), 860, 420, 0, 0, 55, 55);
			button_Player_Left = new GuiButton(3, new ArtButtonSelect_ArrowL(), 300, 530, 0, 0, 55, 55);
			button_Player_Right = new GuiButton(4, new ArtButtonSelect_ArrowR(), 860, 530, 0, 0, 55, 55);
			button_Level_Left = new GuiButton(5, new ArtButtonSelect_ArrowL(), 300, 640, 0, 0, 55, 55);
			button_Level_Right = new GuiButton(6, new ArtButtonSelect_ArrowR(), 860, 640, 0, 0, 55, 55);
			button_Diff = new GuiButtonSelect(7, new ArtButtonSelect_Diff(), 520, 780, -99.5, -41, 199, 82, 3);
			text_level = new GuiText("Level: Overdag", 620, 650, 400, 38, "center", 0xFFFFFF); 
			
			background = new GuiArt(new ArtGuiBackgroundSelect(), 0, 0, 1, 1);
			boat = new GuiArt(new ArtBoat1(), 400, 350, 1 ,1);
			player = new GuiArt(new ArtPlayer1(), boat.x + PlayerAndBoatPositions.playerX[playerselected], boat.y + PlayerAndBoatPositions.playerY[playerselected], 1 ,1);
			
			buttonlist.push(button_Play);
			buttonlist.push(button_Boat_Left);
			buttonlist.push(button_Boat_Right); 
			buttonlist.push(button_Player_Left);
			buttonlist.push(button_Player_Right);
			buttonlist.push(button_Level_Left);
			buttonlist.push(button_Level_Right);
			buttonlist.push(button_Diff);
			
			addChild(background);
			addChild(button_Play);
			addChild(player);	
			addChild(boat);
			addChild(button_Boat_Left);	
			addChild(button_Boat_Right);	
			addChild(button_Player_Left);	
			addChild(button_Player_Right);
			addChild(button_Level_Left);	
			addChild(button_Level_Right);
			addChild(text_level);
			addChild(button_Diff);
		}
		
		override public function action(id:int):void
		{	
			if (id == 0)
			{
				main.switchGui(true, new GuiIngame(main, playerselected, boatselected, difficulty, leveltype));
			}
			
			if (id > 0 && id < 7)
			{
				var breaksave:int = 0;
				if (id == 1)
				{
					playerselected--;
					if (playerselected < 0)
					{
						playerselected = DataGame.players.length - 1;
					}
						
					while (DataGame.players[playerselected].bought == false)
					{
						playerselected--;
						if (playerselected < 0)
						{
							playerselected = DataGame.players.length - 1;
						}
						
						breaksave++;
						if (breaksave > 50) { break; }
					}
				}
				if (id == 2)
				{
					playerselected++;
					if (playerselected > DataGame.players.length - 1)
					{
						playerselected = 0;
					}
						
					while (DataGame.players[playerselected].bought == false)
					{
						playerselected++;
						if (playerselected > DataGame.players.length - 1)
						{
							playerselected = 0;
						}
						
						breaksave++;
						if (breaksave > 50) { break; }
					}
				}
				
				if (id == 3)
				{
					boatselected--;
					if (boatselected < 0)
					{
						boatselected = DataGame.boats.length - 1;
					}
						
					while (DataGame.boats[boatselected].bought == false)
					{
						boatselected--;
						if (boatselected < 0)
						{
							boatselected = DataGame.boats.length - 1;
						}
						
						breaksave++;
						if (breaksave > 50) { break; }
					}
				}
				if (id == 4)
				{
					boatselected++;
					if (boatselected > DataGame.boats.length - 1)
					{
						boatselected = 0;
					}
						
					while (DataGame.boats[boatselected].bought == false)
					{
						boatselected++;
						if (boatselected > DataGame.boats.length - 1)
						{
							boatselected = 0;
						}
						
						breaksave++;
						if (breaksave > 50) { break; }
					}
				}
				
				if (id == 5)
				{
					leveltype--;
					if (leveltype < 1)
					{
						leveltype = 2;
					}
				}
				if (id == 6)
				{
					leveltype++;
					if (leveltype > 2)
					{
						leveltype = 1;
					}
				}
				setArt();
			}
			
			if (id == 7)
			{
				button_Diff.cframe++;
				if (button_Diff.cframe >= button_Diff.mframe)
				{
					button_Diff.cframe = 0;
				}
				button_Diff.setFrame(button_Diff.cframe + 1);
				difficulty = button_Diff.cframe + 1;
			}
		}
		
		override public function tick(keyinput:Array):void
		{
			boat.tick();
			player.tick();
		}
		
		public function setArt():void
		{
			player.setArt(DataGame.players[playerselected].art);
			player.x = boat.x + PlayerAndBoatPositions.playerX[boatselected];
			player.y = boat.y + PlayerAndBoatPositions.playerY[boatselected];
			boat.setArt(DataGame.boats[boatselected].art);
			
			var colortransform:ColorTransform = boat.art.transform.colorTransform;
			colortransform.blueMultiplier = 1.0;
			colortransform.redMultiplier = 1.0;
			colortransform.greenMultiplier = 1.0;
			boat.art.transform.colorTransform = colortransform;
			
			if (leveltype == 1) { text_level.update("Level: Overdag"); } 
			if (leveltype == 2) { text_level.update("Level: Nacht"); } 
		}
	}
}