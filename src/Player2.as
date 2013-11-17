package  
{
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Player2 extends Player
	{
		private var player2:Player2_Art = new Player2_Art();
		public function Player2(fieldRadius:int,shieldRadius:int) 
		{
			addChild(player2);
			player2.x += fieldRadius;
			player2.addChild(drawShield(shieldRadius));
		}
		
	}

}