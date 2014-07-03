package uis 
{	
	/* De levens rechts bovenin het spel tijdens het spelen.
	 * 
	 * eigenschappen:
	 * - art: art van de ui.
	 * - state: of de art frame 1 of 2 moet zijn.
	 */
	
	public class UiHealth extends Ui
	{		
		public var state:Boolean;
		
		public function UiHealth(px:Number, py:Number) 
		{
			art = new ArtHealth();
			addChild(art);
			
			x = px;
			y = py;
			
			art.gotoAndStop(0);
		}	
		
		public function setState(s:Boolean):void
		{
			if (s)
			{
				art.gotoAndStop(1);
			}
			else
			{
				art.gotoAndStop(2);
			}
		}
	}
}