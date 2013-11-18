package gameLayers 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import utils.bitmap.Canvas;
	import utils.bitmap.ParticleSystem;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	
	
	
	public class Background extends Canvas
	{
		[Embed(source="../../lib/img/part3.png")]
		private var particle_png:Class;
		
		public var fire:ParticleSystem;
		
		[Embed(source="../../lib/img/topPart.png")]
		private var Ball_img:Class;
		private var ballTop:Bitmap;
		
		public function Background() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			fire = new ParticleSystem(particle_png);
			addChild(fire);
			//stage.addEventListener(MouseEvent.CLICK, fire.click);
			ballTop = new Ball_img();
			
			//ballTop.x = - ballTop.width / 2;
			//ballTop.y = - ballTop.height / 2;
			//addChild(ballTop);
			
		}
		
		public function drawFire(xPos:int, yPos:int, rot:Number):void {
			canvas.lock();
			//blur(8, 8, 3);
			wipe(0xf00557799);
			fire.draw(xPos, yPos, rot, canvas, 1, 0, 0);
			fire
			canvas.unlock();
			
			
		}
		
	}

}