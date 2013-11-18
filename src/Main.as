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
			
		}
		
		private function startGame(e:Event):void {
			SFX.playMusic(SFX.Music_Game);
			trace();
			removeChild(beginScreen);
			beginScreen = null;
			level = new Level();
			addChild(level);
			level.scoreDisplay.addEventListener(Score.ENDGAME, LoadWinScreen)
		}
		
		private function LoadWinScreen(e:Event):void 
		{
			removeChild(level);
			level = null;
			trace(winningPlayer1 + " " + winningPlayer2);
			if (winningPlayer1)
			{
				trace("player1 wins");
				player1win = new Player1Win();
				addChild(player1win);
				
			}else if (winningPlayer2)
			{
				trace("player 2 win");
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
			init();
		}
	}
	
}