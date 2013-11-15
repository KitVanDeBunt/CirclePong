package  
{
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Player2 extends Player
	{
		private var player2:PlayerArt = new PlayerArt();
		public function Player2(fieldRadius:int,shieldRadius:int) 
		{
			addChild(player2);
			player2.x += fieldRadius;
			player2.rotationZ = 180;
			player2.addChild(drawShield(shieldRadius));
		}
		
	}

}