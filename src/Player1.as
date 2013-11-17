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
		private var player1:Player1_Art = new Player1_Art();
		
		public function Player1(fieldRadius:int,shieldRadius:int) 
		{
			addChild(player1);
			player1.x += fieldRadius;
			player1.addChild(drawShield(shieldRadius));
		}
		
	}

}