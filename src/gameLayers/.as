package gameLayers 
{
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class SFX extends Sprite
	{
		[Embed(source="../../lib/sound/shield bash.mp3")]
		private var ShieldBach_Sound:Class;
		private var shieldBach_Sound = new ShieldBach_Sound();
		
		[Embed(source = "../../lib/sound/start menu music.mp3")]
		private var Menu_Sound:Class;
		private var menu_Sound = new Menu_Sound();
		
		[Embed(source = "../../lib/sound/fire loop.mp3")]
		private var Fire_Sound:Class;
		private var fire_Sound = new Fire_Sound();
		
		[Embed(source = "../../lib/sound/background music done.mp3")]
		private var Game_Sound:Class;
		private var game_Sound = new Game_Sound();
		
		[Embed(source="../../lib/sound/gejuich.mp3")]
		private var Gejuich_Sound:Class;
		private var gejuich_Sound:Sound = (new Gejuich_Sound() as Sound);
		
		//private var Fire:Class;
		//private var fireSound = new Fire();
		
		private var musicChannal:SoundChannel = new SoundChannel();
		public function SFX() 
		{
			//musicChannal = shieldBach_Sound.play();
			//musicChannal = menu_Sound.play();
			//musicChannal = fire_Sound.play();
			//musicChannal = game_Sound.play();
			musicChannal = gejuich_Sound.play();
		}
		
	}

}