package gameLayers
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent
	import flash.display.StageScaleMode;
	import flash.display.StageDisplayState;

	public class Beginscreen extends StartScreen
	{
		static public const START:String = "start";
		//public static const START : String = "start";
			
		public function Beginscreen() 
		{
			startBtn.addEventListener  (MouseEvent.CLICK, StartClick);
			fullscreenBtn.addEventListener(MouseEvent.CLICK, goFull);
		}
		private function StartClick(e:MouseEvent):void 
		{
			dispatchEvent(new Event(START));
		}
		
		//zorg dat het fullscreen event word uitgevoerd.
		private function goFull(event:MouseEvent):void {
			setFullScreen();
		}
		
		//laad het full screen event in.
		private function setFullScreen():void {
			if (stage.displayState == StageDisplayState.NORMAL) {
				stage.displayState = StageDisplayState.FULL_SCREEN;
				stage.scaleMode = StageScaleMode.SHOW_ALL;
			} else {
				stage.displayState = StageDisplayState.NORMAL;
			}
		}
	}
}