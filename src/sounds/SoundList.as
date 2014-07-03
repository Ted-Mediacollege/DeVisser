package sounds 
{
	import flash.media.Sound;
	
	/* Hier worden alle sounds opgeslagen in arrays.
	 * 
	 * eigenschappen:
	 * - list_music: lijst met alle muziek.
	 * - lise_sounds: lijst met alle sound effects.
	 */
	
	public class SoundList 
	{
		public static var list_music:Array = new Array(
			new Music_MENU(),
			new Music_SHOP(),
			new Music_WAVES()
		);
		
		public static var list_sounds:Array = new Array(
			new Sound_BUY(),
			new Sound_RODUP(),
			new Sound_CATCHFISH(),
			new Sound_CLICK(),
			new Sound_HOVER()
		);
	}
}