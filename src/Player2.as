package  
{
	import flash.display.Sprite;
	import utils.debug.Debug;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Player2 extends Player
	{
		private var player2:Player2_Art = new Player2_Art();
		//private var player2:Sprite = new Sprite();
		public function Player2(fieldRadius:int,shieldRadius:int) 
		{
			addChild(player2);
			player2.x += fieldRadius;
			Debug.test(function():void { player2.addChild(drawShield(shieldRadius)); },Debug.Kit_Draw_Objects);
		}
		
	}

}