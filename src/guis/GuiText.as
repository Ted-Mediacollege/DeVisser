package guis 
{
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	
	public class GuiText extends MovieClip
	{	
		public var format:TextFormat = new TextFormat();
		public var text:TextField = new TextField();		
		
		public function GuiText(textString:String, posX:Number, posY:Number, width:Number, size:int, align:String, color:uint) 
		{			
			format = new TextFormat()
			format.size = size;
			format.font = "costumFont"; 
			format.align = align;
			format.color = color;
			
			text = new TextField();
			
			if (align == "center") { text.x = posX - (width / 2); }
			else { text.x = posX; }
			text.y = posY;
			text.width = width;
			text.antiAliasType = AntiAliasType.ADVANCED;
			text.embedFonts = true;
			text.selectable = false;
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