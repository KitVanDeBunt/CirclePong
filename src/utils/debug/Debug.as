package utils.debug 
{
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	public class Debug
	{
		//example
		
		/*Debug.test(function():void { 
			//draw stuff
			drawStuff();
			//print info
			trace("info");
		} , Debug.Kit_bounce);*/
		
		/*Debug.test(function():void { 
			//draw stuff
			drawStuff();
			//print info
			trace("info");
		} , Debug.Fabian);*/
		
		public static const Kit_bounce:String = "kit_bounce";
		public static const Kit_Draw_Objects:String = "kit_drawobjects";
		public static const Kit:String = "kit";
		public static const Fabian:String = "fabian";
		public static const ALL:String = "all";
		private static const OFF:String = "off";
		private static var USER:Vector.<String> = new <String>[Kit_bounce]; //enter all user u want to print for
		
		public static function test(func:Function,user:String):Function 
		{
			for (var i:int = 0; i < USER.length; i++) 
			{
				if (USER[i]== user){
					return func();
					break;
				}
			}
			return null;
		}
	}
}