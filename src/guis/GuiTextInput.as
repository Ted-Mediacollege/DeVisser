package guis 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;
	import flash.text.TextField;
	
	public class GuiTextInput extends MovieClip
	{
		public var format:TextFormat = new TextFormat();
		public var text:TextField = new TextField();		
		
		public function GuiTextInput(textString:String, posX:Number, posY:Number, width:Number, size:int, color:uint) 
		{			
			format = new TextFormat()
			format.size = size;
			format.font = "costumFont"; 
			format.align = "left";
			format.color = color;
			
			text = new TextField();
			text.x = posX;
			text.y = posY;
			text.width = width;
			text.type = "input";
			text.embedFonts = true;
			text.maxChars = 20;
			text.restrict = "A-Za-z0-9";
			addChild(text);
			
			text.text = textString;
			text.setTextFormat(format);
		}	
		
		public function update(newString:String):void
		{
			text.text = newString;
			text.setTextFormat(format);
		}
	}
}