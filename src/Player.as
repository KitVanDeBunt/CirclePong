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
		
		
		public function MovePlayer(boolMoveRight:Boolean = false,boolMoveLeft:Boolean = false):void
		{
			if(boolMoveLeft&&!boolMoveRight){
				this.rotationZ += 1.5;
			}else if (!boolMoveLeft && boolMoveRight) {
				this.rotationZ -= 1.5;
			}
		}
		
		public function drawShield(radius:int):Sprite {
			var shield:Sprite = new Sprite;
			shield.x = 20;
			shield.graphics.lineStyle(5, 0, 0.3);
			shield.graphics.drawCircle(-radius, 0, radius);
			return shield;
		};
	}

}