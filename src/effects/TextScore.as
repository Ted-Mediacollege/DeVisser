package effects 
{
	import flash.text.TextFormat;
	import flash.text.TextField;
	
	/* Score text animatie
	 * 
	 * methods:
	 * tick() wordt elke frame aangeroepen
	 * 
	 * parameters:
	 * - score: het nummer dat weergeven moet worden.
	 * - px: de x-positie van de text
	 * - py: de y-positie van de text
	 * - vx: de x-velocity van de text
	 * - vy: de y-velocity van de text
	 * 
	 * eigenschappen:
	 * - format: font eigenschappen van de text
	 * - text: de text die weegeven wordt
	 * - frame: aantal frames sinds het gecreeerd was
	 * - done: of de text animatie af is
	 * - velX: de x-velocity van de text
	 * - velY: de y-velocity van de text
	 */
	
	public class TextScore extends Text
	{
		public var format:TextFormat = new TextFormat();
		public var text:TextField = new TextField();
		public var frame:int;
		public var done:Boolean;
		
		public function TextScore(score:int, px:Number, py:Number, vx:Number, vy:Number) 
		{
			var scoreString:String;
			if (score > -1)
			{
				scoreString = "+" + score;
			}
			else
			{
				scoreString = "" + score;
			}
			
			format = new TextFormat()
			format.size = 48;
			format.font = "costumFont"; 
			format.align = "center";
			if (score > -1)
			{
				format.color = 0x00FF00;
			}
			else
			{
				format.color = 0xFF0000;
			}
			
			text = new TextField();
			text.x = px - 200;
			text.y = py;
			text.width = 400;
			text.embedFonts = true;
			addChild(text);
			frame = 200;
			done = false;
			
			velX = vx;
			velY = vy;
			
			text.text = scoreString;
			text.setTextFormat(format);
		}	
		
		override public function tick():void
		{
			frame-=3;
			if (frame > -1 && frame < 100)
			{
				text.alpha = frame / 100;
			}
			else if (frame < 0)
			{
				done = true;
			}
			
			x += velX;
			y += velY;
		}
	}
}