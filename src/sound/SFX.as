package sound 
{
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class SFX
	{
		public static var Sound_Shield:String = "gejuich";
		public static var Music_Menu:String = "menu";
		public static var Sound_Fire:String = "fire";
		public static var Music_Game:String = "game";
		public static var Sound_Gejuich:String = "gejuich";
		
		private static var soundList:Vector.<SoundHolder> = new Vector.<SoundHolder>;
		
		[Embed(source="../../lib/sound/shield bash.mp3")]
		private static var ShieldBach_Sound:Class;
		[Embed(source = "../../lib/sound/start menu music.mp3")]
		private static var Menu_Sound:Class;
		[Embed(source = "../../lib/sound/fire loop.mp3")]
		private static var Fire_Sound:Class;
		[Embed(source = "../../lib/sound/background music done.mp3")]
		private static var Game_Sound:Class;
		[Embed(source="../../lib/sound/gejuich.mp3")]
		private static var Gejuich_Sound:Class;
		
		private static var musicChannal:SoundChannel = new SoundChannel();
		
		
		public static function initSFX():void 
		{
			soundList[0] = new SoundHolder(Sound_Shield, new ShieldBach_Sound());
			soundList[1] = new SoundHolder(Music_Menu, new Menu_Sound());
			soundList[2] = new SoundHolder(Sound_Fire, new Fire_Sound());
			soundList[3] = new SoundHolder(Music_Game, new Game_Sound());
			soundList[4] = new SoundHolder(Sound_Gejuich,new Gejuich_Sound());
		}
		/**
		* plays music in a loop
		* @param use one off the public static strings in the SFX class
		*/
		public static function playMusic(musicName:String):void {
			musicChannal.stop();
			for (var i:int = 0; i < soundList.length; i++) 
			{
				if(soundList[i].name == musicName){
					musicChannal = soundList[i]._sound.play();
				}
			}
		}
	}
}