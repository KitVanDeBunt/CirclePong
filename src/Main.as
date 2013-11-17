package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import gameLayers.Beginscreen;
	import gameLayers.Level;
	import sound.SFX;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Main extends Sprite 
	{
		
		private var beginScreen:Beginscreen;
		private var level:Level;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//init sound
			SFX.initSFX();
			SFX.playMusic(SFX.Music_Menu);
			// load menu
			beginScreen = new Beginscreen();
			addChild(beginScreen);
			beginScreen.addEventListener(Beginscreen.START, startGame);
		}
		
		private function startGame(e:Event):void {
			SFX.playMusic(SFX.Music_Game);
			removeChild(beginScreen);
			beginScreen = null;
			level = new Level();
			addChild(level);
		}
	}
	
}