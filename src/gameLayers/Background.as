package gameLayers 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.geom.Matrix;
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
		
		[Embed(source="../../lib/img/topPart2.png")]
		private var Ball_img:Class;
		private var ballHead:Bitmap;
		private var ballDisplacmentW:int;
		private var ballDisplacmentH:int;
		
		public function Background() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			fire = new ParticleSystem(particle_png);
			addChild(fire);
			//stage.addEventListener(MouseEvent.CLICK, fire.click);
			ballHead = new Ball_img();
			
			ballDisplacmentW = - ballHead.width / 2;
			ballDisplacmentH = - ballHead.height / 2;
			//addChild(ballTop);
			
		}
		
		public function drawFire(xPos:int, yPos:int, rot:Number):void {
			canvas.lock();
				//draw particles
				//blur(8, 8, 3);
				wipe(0xf00557799);
				fire.draw(xPos, yPos, rot, canvas, 1, 0, 0);
				//draw head
				var headBallMatrix:Matrix = new Matrix();
				headBallMatrix.translate( ballDisplacmentW, ballDisplacmentH+10);
				headBallMatrix.rotate(rot+Math.PI/2);
				headBallMatrix.translate( xPos, yPos);
				canvas.draw(ballHead ,headBallMatrix);
			canvas.unlock();
		}
		
	}

}