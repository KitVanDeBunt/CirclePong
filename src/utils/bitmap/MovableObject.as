package utils.bitmap
{
	/**
	 * ...
	 * @author Kit
	 */
	public class MovableObject 
	{
		
		public var xP:Number;
		public var yP:Number;
		public var speed:Number;
		public var rotation:Number;
		public var lifeTime:int;
		public var startLifeTime:int;
		public var color:uint;
		public var slowDown:Number;
		public function MovableObject(XP:int,YP:int,Speed:Number,Rotation:Number,LifeTime:int,SlowDown:Number) 
		{
			xP = XP;
			yP = YP;
			speed = Speed;
			rotation = Rotation;
			lifeTime = LifeTime;
			startLifeTime = LifeTime;
			slowDown = SlowDown;
			//color = 0xffffffff * Math.random();
		}
		
		/*public function setRotSpeed(Speed:Number, Rotation:Number):void {
			speed = Speed;
			rotation = Rotation;
		}*/
		
		public function check() {
			trace(speed + " xp:" + xP + " yp:" + yP + " rot:" + rotation);
		}
		
		public function move():void {
			
			speed *= slowDown;
			var angle:Number = rotation /** Math.PI / 180*/;
			xP += speed * Math.cos(rotation);
			yP += speed * Math.sin(rotation);
			lifeTime--;
		}
		
	}

}