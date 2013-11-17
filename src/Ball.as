package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Ball extends MovingObject
	{
		
		//private var ball:BallArt = new BallArt();
		public var ballOnField:Boolean;
		public function Ball() 
		{
			ballOnField = true;
			var XSpeed:Number = (Math.random() -0.5) ;
			var YSpeed:Number = (Math.random() -0.5) ;
			if (XSpeed > 0) {
				XSpeed += 3;
			}else {
				XSpeed -= 3;
			}
			if (YSpeed > 0) {
				YSpeed += 3;
			}else {
				YSpeed -= 3;
			}
			super(XSpeed,YSpeed);
			//addChild(ball);
		}
		
	}

}