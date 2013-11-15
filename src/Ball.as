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
		
		private var ball:BallArt = new BallArt();
		public function Ball() 
		{
			var XSpeed:Number = (Math.random() -0.5) ;
			var YSpeed:Number = (Math.random() -0.5) ;
			if (XSpeed > 0) {
				XSpeed += 1.3;
			}else {
				XSpeed -= 1.3;
			}
			if (YSpeed > 0) {
				YSpeed += 1.3;
			}else {
				YSpeed -= 1.3;
			}
			super(XSpeed,YSpeed);
			//super(-1,0);
			//super(-1,-1);
			addChild(ball);
			
		}
		
	}

}