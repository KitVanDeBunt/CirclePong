package utils 
{
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	public class Random 
	{
		public static function rangePosNum(min:Number, max:Number):Number
		{
			return ((Math.random() * (max-min)) + min);
		}
	}

}