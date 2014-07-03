package network 
{
	/* Laad en ontvangt highscore van de highscore database.
	 * 
	 * methods:
	 * - loadHighscore(String) laad alle highscore data
	 * - recieveData(Event) wordt aangeroepen waneer er data van de urlrequest is ontvangen.
	 */
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequestMethod;
	import flash.events.Event;
		
	public class GetData 
	{	
		public static function loadHighscore(list:String):void
		{
			if (Main.network)
			{
				try
				{
					var loader:URLLoader = new URLLoader;
					var urlreq:URLRequest = new URLRequest(Main.database + "?type=load&list=" + list);
					var urlvars: URLVariables = new URLVariables;
					loader.dataFormat = URLLoaderDataFormat.TEXT;
					loader.addEventListener(Event.COMPLETE, recieveData);
					loader.load(urlreq);				
				}
				catch (e:Error)
				{
					trace("Cannot connect to php highscore database");
				}
			}
		}
		
		public static function recieveData(event:Event):void
		{
			if (Main.network)
			{
				try
				{
					var reciever:URLLoader = URLLoader(event.target);
					var string:String = reciever.data;
					var array:Array = string.split("*");
					var id:int = 0;
					if (array[0] == "list_beginner") { id = 1; }
					if (array[0] == "list_ervaren") { id = 2; }
					if (array[0] == "list_meester") { id = 3; }
					
					Main.gui.receivedata(id, array[1]); 				
				}
				catch (e:Error)
				{
					trace("Cannot connect to php highscore database");
				}
			}
		}
	}
}