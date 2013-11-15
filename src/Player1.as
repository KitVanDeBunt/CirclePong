package  
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Player1 extends Player
	{
		private var player1:PlayerArt = new PlayerArt();
		
		public function Player1(fieldRadius:int,shieldRadius:int) 
		{
			addChild(player1);
			player1.x += fieldRadius;
			player1.rotationZ = 180;
			player1.addChild(drawShield(shieldRadius));
		}
		
	}

}