package utils.bitmap
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Kit
	 */
	public class Canvas extends Sprite
	{
		public var canvas:BitmapData;
		public var canvasHolder:Bitmap;
		public var stageRect:Rectangle;
		
		public function Canvas(alpha:Boolean = true, width:int = 700, height:int = 700) 
		{
			canvas  = new BitmapData(width, height, true, 0x00ffffff);
			stageRect  = new Rectangle(0, 0, width, height);
			canvasHolder = new Bitmap(canvas);
			addChild(canvasHolder);
		}
		
		public function blur(blurx:Number,blury:Number,quality:int):void {
			var filter:BlurFilter = new BlurFilter(blurx,blury,quality);
			canvas.applyFilter(canvas, stageRect, new Point(), filter);
			
			//canvas.fillRect(stageRect, 0xff000000);
		}
		
		public function wipe(WipeColor:uint):void {
			canvas.fillRect(stageRect, WipeColor);
		}
	}

}