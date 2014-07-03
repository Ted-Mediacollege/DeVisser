package guis 
{
	import flash.display.MovieClip;
	
	public class GuiAchievementsItem extends MovieClip
	{		
		public var artFrame:GuiArt;
		public var artIcon:GuiArt;
		
		public var done:Boolean;
		public var artID:int;
		
		public var baseX:Number;
		public var baseY:Number;
		
		public var title:String;
		public var task:String;
		
		public var text_title:GuiText;
		public var text_task:GuiText;
		
		public function GuiAchievementsItem(d:Boolean, px:Number, py:Number, i:int, ti:String, ta:String) 
		{
			done = d;
			
			x = px;
			y = py;
			baseX = px;
			baseY = py;
			
			title = ti;
			task = ta;
			
			artFrame = new GuiArt(new ArtGuiBackgroundTrophieFrame(), px, py, 1, 1);
			
			if (done) 
			{
				artIcon = new GuiArt(new ArtTrophies(), px - 200, py + 70, 0.34, 0.34);
				artIcon.setFrame(i);
			}
			else
			{
				artIcon = new GuiArt(new ArtTrophiesDisabled(), px - 200, py + 70, 0.34, 0.34);
				artIcon.setFrame(i);
			}
			
			var c:uint;
			if (done) { c = 0xFFFFFF; } else { c = 0xAAAAAA; }
			text_title = new GuiText(title, px - 100, py - 70, 400, 36, "left", c);
			text_task = new GuiText(task, px - 100, py, 400, 20, "left", c);
			
			addChild(artFrame);
			addChild(artIcon);
			addChild(text_title);
			addChild(text_task);
		}	
	}
}