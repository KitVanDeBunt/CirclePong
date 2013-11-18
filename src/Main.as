package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import gameLayers.Beginscreen;
	import gameLayers.Level;
	import gameLayers.WinScreen;
	import score.Score;
	import sound.SFX;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Main extends Sprite 
	{
		public static var winningPlayer1:Boolean;
		public static var winningPlayer2:Boolean;
		private var player2win:Player2Win;
		private var player1win:Player1Win;
		private var tieScreen:Tie;
		private var beginScreen:Beginscreen;
		private var restartButton:Restart = new Restart();
		private var endGame:WinScreen;
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
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void {
			if (level) {
				level.loop();
			}
			SFX.loopSound();
		}
		
		private function startGame(e:Event):void {
			SFX.playMusic(SFX.Music_Game);
			trace();
			removeChild(beginScreen);
			beginScreen = null;
			level = new Level();
			addChild(level);
			stage.stageFocusRect = false;
			stage.focus = level;
			level.scoreDisplay.addEventListener(Score.ENDGAME, LoadWinScreen)
		}
		
		private function LoadWinScreen(e:Event):void 
		{
			removeChild(level);
			level = null;
			if (winningPlayer1)
			{
				player1win = new Player1Win();
				addChild(player1win);
				
			}else if (winningPlayer2)
			{
				player2win = new Player2Win();
				addChild(player2win);
			}else if(!winningPlayer1 && !winningPlayer2)
			{
				tieScreen = new Tie();
				addChild(tieScreen);
			}
			addChild(restartButton);
			restartButton.x = 150;
			restartButton.y = 500;
			restartButton.addEventListener(MouseEvent.CLICK, restartGame)
		}
		
		private function restartGame(e:MouseEvent):void 
		{
			if(player1win != null){
				removeChild(player1win);
				player1win = null;
			}
			if(player2win != null){
				removeChild(player2win);
				player2win = null;
			}
			if(tieScreen != null){
				removeChild(tieScreen);
				tieScreen = null;
			}
			//SFX.playMusic(SFX.Music_Menu);
			init();
		}
	}
	
}