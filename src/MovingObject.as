package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class MovingObject extends Sprite
	{
		public var Velocity:Vector2D;
		public function MovingObject(velocityX:Number = 0 ,velocityY:Number = 0) 
		{
			Velocity = new Vector2D(velocityX, velocityY);
			
			
		}
		public function loop()
		{
			this.x += Velocity.x;
			this.y += Velocity.y;
			
		}
		
	}

}