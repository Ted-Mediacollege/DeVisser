package guis 
{
	import flash.display.MovieClip;
	
	public class Gui extends MovieClip 
	{
		public var buttonlist:Array = new Array();
	
		public function guiInit():void { }
		public function action(id:int):void { }
		public function esc():void { }
		public function scroll(dir:int):void { }
		public function tick(keyinput:Array):void { }
		public function receivedata(id:int, data:String):void { }
		public function unFocus():void { }
	}
}