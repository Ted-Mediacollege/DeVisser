package guis 
{
	import flash.display.MovieClip;
	import data.DataGame;
	import data.SaveData;
	
	import sounds.SoundList;
	import sounds.SoundPlayer;

	public class GuiShop extends Gui 
	{
		private var main:Main;

		public var button_menu:GuiButton;
		public var button_prev:GuiButton;
		public var button_next:GuiButton;
		public var button_boats:GuiButtonPress;
		public var button_players:GuiButtonPress;
		public var button_buy:GuiButton;
		
		public var text_coins:GuiText;
		public var text_cost:GuiText;
		public var text_soldout:GuiText;
		
		public var background:GuiArt;
		public var buyscreen:GuiArt;
		public var itemArt:GuiArt;
		
		public var type:int;
		public var item:int;
		
		public var ITEMS_BOATS:Array;
		public var ITEMS_PLAYERS:Array;
		
		public function GuiShop(m:Main) 
		{
			main = m;
		}
		
		override public function guiInit():void
		{
			SoundPlayer.switchBackgroundMusic(SoundList.list_music[1]);
			
			button_menu = new GuiButton(0, new ArtButtonPause_Menu(), 600, 800, -164, -49, 328, 98); 
			button_prev = new GuiButton(1, new ArtButtonSelect_ArrowL(), 500, 400, 0, 0, 55, 55);
			button_next = new GuiButton(2, new ArtButtonSelect_ArrowR(), 1030, 400, 0, 0, 55, 55);
			button_boats = new GuiButtonPress(3, new ArtButtonShop_Boat(), 245, 285, 0, 0, 141, 141);
			button_players = new GuiButtonPress(4, new ArtButtonShop_Player(), 245, 285 + 160, 0, 0, 141, 141);
			button_buy = new GuiButton(5, new ArtButtonShop_Buy(), 790, 605, -117, -35, 234, 70);
			background = new GuiArt(new ArtGuiBackgroundShop(), 0, 0, 1, 1);
			buyscreen = new GuiArt(new ArtGuiBackgroundShopScreen(), 580, 290, 1, 1);
			text_cost = new GuiText("ITEM COST", 790, 510, 400, 28, "center", 0xFFFFFF);
			text_coins = new GuiText("YOUR MONEY", 790, 276, 400, 28, "center", 0xFFFFFF);
			text_soldout = new GuiText("Uitverkocht!", 790, 410, 400, 30, "center", 0xFFFFFF);
			
			buttonlist.push(button_menu);
			buttonlist.push(button_prev);
			buttonlist.push(button_next);
			buttonlist.push(button_boats);
			buttonlist.push(button_players);
			buttonlist.push(button_buy);
			
			addChild(background);
			addChild(buyscreen);
			addChild(button_menu);
			addChild(button_prev);
			addChild(button_next);
			addChild(button_boats);
			addChild(button_players);
			addChild(button_buy);
			addChild(text_cost);
			addChild(text_coins);
			addChild(text_soldout);
			
			text_soldout.alpha = 0;
			
			ITEMS_BOATS = new Array();
			ITEMS_PLAYERS = new Array();
			
			for (var i:int = 0; i < DataGame.boats.length; i++ )
			{
				if (DataGame.boats[i].bought == false)
				{
					ITEMS_BOATS.push(new GuiShopItem(DataGame.boats[i].cost, i));
				}
			}
			
			for (var j:int = 0; j < DataGame.players.length; j++ )
			{
				if (DataGame.players[j].bought == false)
				{
					ITEMS_PLAYERS.push(new GuiShopItem(DataGame.players[j].cost, j));
				}
			}
			
			if (ITEMS_BOATS.length < 1)
			{
				button_boats.press(false);
				button_players.press(true);
				type = 2;
			}
			else
			{
				button_boats.press(true);
				button_players.press(false);
				type = 1;
			}
			
			item = 0;
			updateshop(0);
		}
		
		override public function action(id:int):void
		{	
			if (id == 0)
			{
				SoundPlayer.switchBackgroundMusic(SoundList.list_music[0]);
				main.switchGui(true, new GuiMenu(main));
			}
			if (id == 1)
			{
				updateshop(-1);
			}
			if (id == 2)
			{
				updateshop(1);
			}
			if (id == 3)
			{
				type = 1;
				item = 0;
				button_boats.press(true);
				button_players.press(false);
				updateshop(0);
			}
			if (id == 4)
			{
				type = 2;
				item = 0;
				button_boats.press(false);
				button_players.press(true);
				updateshop(0);
			}
			if (id == 5)
			{
				if (type == 1)
				{
					if (ITEMS_BOATS.length > 0)
					{
						if (DataGame.coins >= ITEMS_BOATS[item].cost )
						{
							DataGame.coins -= ITEMS_BOATS[item].cost;
							DataGame.boats[ITEMS_BOATS[item].id].bought = true;
							ITEMS_BOATS.splice(item, 1);
							updateshop(0);
							SoundPlayer.playSoundEffect(SoundList.list_sounds[0]);
						}
					}
				}
				else if (type == 2)
				{
					if (ITEMS_PLAYERS.length > 0)
					{
						if (DataGame.coins >= ITEMS_PLAYERS[item].cost )
						{
							DataGame.coins -= ITEMS_PLAYERS[item].cost;
							DataGame.players[ITEMS_PLAYERS[item].id].bought = true;
							ITEMS_PLAYERS.splice(item, 1);
							updateshop(0);
							SoundPlayer.playSoundEffect(SoundList.list_sounds[0]);
						}
					}
				}
				
				if (Main.saving)
				{
					SaveData.save();
				}
			}
		}
		
		public function updateshop(dir:int):void 
		{			
			if (itemArt != null)
			{
				removeChild(itemArt);
				itemArt = null;
			}
			
			text_cost.update("");
					
			if (type == 1)
			{
				item += dir;
				if (ITEMS_BOATS.length > 0)
				{
					if (item < 0)
					{
						item = ITEMS_BOATS.length - 1;
					}
					else if (item > ITEMS_BOATS.length - 1)
					{
						item = 0;
					}
					itemArt = new GuiArt(new ArtGuiIcons_Boats(), 800, 490, 0.6, 0.6);
					itemArt.setFrame(ITEMS_BOATS[item].id + 1);
					addChild(itemArt);
					text_cost.update("$ " + ITEMS_BOATS[item].cost);
					text_soldout.alpha = 0;
				}
				else
				{
					text_soldout.alpha = 1;
				}
			}
			else if (type == 2)
			{
				item += dir;
				if (ITEMS_PLAYERS.length > 0)
				{
					if (item < 0)
					{
						item = ITEMS_PLAYERS.length - 1;
					}
					else if (item > ITEMS_PLAYERS.length - 1)
					{
						item = 0;
					}
					itemArt = new GuiArt(new ArtGuiIcons_Players(), 740, 490, 0.7, 0.7);
					itemArt.setFrame(ITEMS_PLAYERS[item].id + 1);
					addChild(itemArt);
					text_cost.update("$ " + ITEMS_PLAYERS[item].cost);
					text_soldout.alpha = 0;
				}
				else
				{
					text_soldout.alpha = 1;
				}
			}
			
			text_coins.update("Jouw geld: $ " + DataGame.coins);
		}
		
		override public function tick(keyinput:Array):void
		{
		}
	}
}