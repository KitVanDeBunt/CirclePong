package Score 
{
	import flash.display.MovieClip;
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class HighScore extends MovieClip 
	{
		private var scoreInhoud:Array = new Array();
		private var ui:UI = new UI();
		public function HighScore() 
		{
			addChild(ui);
			ui.x = 250;
			
			
			var mySharedObject:SharedObject = SharedObject.getLocal("republicofcode");
			mySharedObject.data.score = scoreInhoud;
			mySharedObject.flush();
			
			trace(mySharedObject.data.score);
			trace(mySharedObject.data.score.length);
			
		}
		
	}

}