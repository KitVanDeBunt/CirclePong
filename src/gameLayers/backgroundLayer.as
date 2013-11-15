package gameLayers 
{
	import flash.events.Event;
	import utils.bitmap.Canvas;
	import utils.bitmap.ParticleSystem;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	
	
	
	public class backgroundLayer extends Canvas
	{
		[Embed(source="../img/part1.png")]
		private var particle_png:Class;
		
		public var fire:ParticleSystem;
		
		public function backgroundLayer() 
		{addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		public function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			fire = new ParticleSystem(particle_png);
			addChild(fire);
			
			
			stage.addEventListener(MouseEvent.CLICK, fire.click);
		}
		
		public function drawFire(xPos:int,yPos:int):void {
			blur(4, 4, 1);
			//wipe(0xf00557799);
			fire.draw(xPos, yPos, canvas,3,1.2,0.8);
		}
		
	}

}