package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Player extends MovieClip
	{
		private var rotationDelta:Number = 0;
		private var maxRotation:Number = 80;
		public function MovePlayer(boolMoveRight:Boolean = false,boolMoveLeft:Boolean = false):void
		{
			if (boolMoveLeft && !boolMoveRight) {
				if (rotationDelta < maxRotation) {
					this.rotationZ += 1.5;
					rotationDelta += 1.5;
				}
			}else if (!boolMoveLeft && boolMoveRight) {
				if(rotationDelta>-maxRotation){
					this.rotationZ -= 1.5;
					rotationDelta -= 1.5;
				}
			}
		}
		
		public function drawShield(radius:int):Sprite {
			var shield:Sprite = new Sprite;
			shield.x = radius+20;
			shield.graphics.lineStyle(5, 0, 0.3);
			shield.graphics.drawCircle(-radius, 0, radius);
			return shield;
		}
	}
}