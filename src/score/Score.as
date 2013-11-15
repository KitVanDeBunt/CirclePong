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
		public function Score() 
		{
			
			addChild(ui);

			ui.Score2.ScorePlayer2.text = String(scorePlayer2);
			ui.Score1.ScorePlayer1.text = String(scorePlayer1);
			//dit is unrelated het zorgt er voor alleen dat het update.
			UpdateScore(scorePlayer1,scorePlayer2);
		}
		public function getScore ():Point
		{ 
			
			return new Point(scorePlayer1,scorePlayer2); 
		}
		//de functie werkt via de _scorePlayer1 en _scorePlayer2, dus geen dubbelen variabelen.
		public function UpdateScore(_scorePlayer1:int, _scorePlayer2:int):void 
		{
			//hier word de score aangemaakt en aangepast
			_scorePlayer1 = 10;
			_scorePlayer2 = 20;
			scorePlayer1 = _scorePlayer1;
			scorePlayer2 = _scorePlayer2;
			//dit maakt het string 
			ui.Score2.ScorePlayer2.text = String(scorePlayer2);
			ui.Score1.ScorePlayer1.text = String(scorePlayer1);
			//trace(scorePlayer1);
			//trace(scorePlayer2);
		}
		
	}

}