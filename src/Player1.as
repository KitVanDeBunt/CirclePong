package  
{
	import flash.display.Sprite;
	import utils.debug.Debug;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Player1 extends Player
	{
		private var player1:Player1_Art = new Player1_Art();
		//private var player1:Sprite = new Sprite();
		
		public function Player1(fieldRadius:int,shieldRadius:int) 
		{
			addChild(player1);
			player1.x += fieldRadius;
			Debug.test(function():void { player1.addChild(drawShield(shieldRadius)); },Debug.Kit_Draw_Objects);
		}
		
	}

}