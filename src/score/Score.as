package score 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Score extends Sprite
	{
		private var scorePlayer1:int;
		private var scorePlayer2:int;
		
		private var ui:UI = new UI();
		private var ticks:int;
		private var time:int;
		public function Score() 
		{
			addChild(ui);
			ui.Score2.ScorePlayer2.text = String(scorePlayer2);
			ui.Score1.ScorePlayer1.text = String(scorePlayer1);
			ticks = 0;
			time = 0;
		}
		public function getScore ():Point
		{ 
			return new Point(scorePlayer1,scorePlayer2); 
		}
		
		public function updateTimer():void {
			ticks++;
			if (ticks >= 30) {
				ticks = 0;
				time++;
				ui.TimerHolderHolder.TimerHolder.Timer.text = time;
			}
		}
		
		//de functie werkt via de _scorePlayer1 en _scorePlayer2, dus geen dubbelen variabelen.
		public function UpdateScore(_scorePlayer1:int = 0, _scorePlayer2:int = 0):void 
		{
			//hier word de score aangemaakt en aangepast
			scorePlayer1 += _scorePlayer1;
			scorePlayer2 += _scorePlayer2;
			//dit maakt het string 
			ui.Score2.ScorePlayer2.text = String(scorePlayer2);
			ui.Score1.ScorePlayer1.text = String(scorePlayer1);
			//trace(scorePlayer1);
			//trace(scorePlayer2);
		}
		
	}

}