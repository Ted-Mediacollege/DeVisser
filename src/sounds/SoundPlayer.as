package sounds 
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
		
	public class SoundPlayer
	{
		/* Class waarmee alle sounds en muziek in de game worden afgespeeld.
		 * 
		 * methods:
		 * - startBackgroundMusic(Sound) start de background music
		 * - switchBackgroundMusic(Sound) stopt en verandert de muziek naar een nieuw muziekje
		 * - loopBackgroundMusic(Event) wordt aangeroepen waneer de muziek eindigt
		 * - playSoundEffect(Sound) speelt een sound af
		 * - playRodSound() speelt de rod sound af
		 * - stopRodSound() stop het afspelen van de rod sound
		 * 
		 * eigenschappen:
		 * - volume: de volume van al het geluid
		 * - rodSound: sound van de hengel
		 * - backgroundMusic: de background muziek die wordt afgespeeld
		 * - channel_general: de soundeffects channel
		 * - channel_background: de background music channel
		 * - channel_rod: de rod sound channel
		 */
		
		public static var volume:Number = 0.2;
		
		public static var rodSound:Sound;
		public static var backgroundMusic:Sound;
		
		public static var channel_general:SoundChannel = new SoundChannel();
		public static var channel_background:SoundChannel = new SoundChannel();
		public static var channel_rod:SoundChannel = new SoundChannel();
		
		public static var transform_general:SoundTransform = new SoundTransform();
		public static var transform_background:SoundTransform = new SoundTransform();
		public static var transform_rod:SoundTransform = new SoundTransform();
		
		public static function startBackgroundMusic(m:Sound):void
		{	
			backgroundMusic = m;
			channel_background = backgroundMusic.play();
			channel_background.addEventListener(Event.SOUND_COMPLETE, loopBackgroundMusic);
			transform_background.volume = 0.1;
			channel_background.soundTransform = transform_background;
		}
		
		public static function switchBackgroundMusic(m:Sound):void
		{
			channel_background.removeEventListener(Event.SOUND_COMPLETE, loopBackgroundMusic);
			channel_background.stop();
			startBackgroundMusic(m);
		}
		
		public static function loopBackgroundMusic(e:Event):void
		{
			startBackgroundMusic(backgroundMusic);
		}
		
		public static function playSoundEffect(s:Sound):void
		{
			var sound:Sound = s;
			channel_general = sound.play();
			transform_general.volume = volume;
			channel_general.soundTransform = transform_general;
		}
		
		public static function playRodSound():void
		{
			rodSound = SoundList.list_sounds[1];
			channel_rod = rodSound.play();
			transform_rod.volume = volume;
			channel_rod.soundTransform = transform_rod;
		}
		
		public static function stopRodSound():void
		{
			channel_rod.stop();
		}
	}
}