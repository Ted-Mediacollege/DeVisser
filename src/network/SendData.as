package network 
{
	/* Verstuurd data naar de highscore database.
	 * 
	 * methods:
	 * - sendHighscore(String, int) verstuurd highscore data naar de highscore database.
	 */
	
	import data.DataGame;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequestMethod;
	import flash.events.Event;
	
	public class SendData 
	{
		public static function sendHighscore(list:String, score:int):void
		{
			if (Main.network)
			{
				try 
				{
					var date:Date = new Date;
					var d:Number = date.date;
					var m:Number = date.month + 1;
					var y:Number = date.fullYear;
					var loader:URLLoader = new URLLoader;
					var urlreq:URLRequest = new URLRequest(Main.database + "?type=submit&list=" + list + "&score=" + score + "&name=" + DataGame.name + "&date=" + d + "-" + m + "-" + y);
					var urlvars: URLVariables = new URLVariables;
					loader.dataFormat = URLLoaderDataFormat.TEXT;
					loader.load(urlreq);					
				}
				catch (e:Error)
				{
					trace("Cannot connect to php highscore database");
				}
			}
		}
	}
}