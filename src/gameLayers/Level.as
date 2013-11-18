package gameLayers
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import gameLayers.Background;
	import score.Score;
	import utils.Stats;
	import utils.debug.Debug;
	
	/**
	 * ...
	 * @author Fabian Verkuijlen & Kit van de Bunt
	 */
	public class Level extends Sprite
	{
		private var playerX:int = 0;
		private var playerY:int = 0;
		private var Wkey:Boolean = false;
		private var Skey:Boolean = false;
		private var Ikey:Boolean = false;
		private var Kkey:Boolean = false;
		private var player1:Player1;
		private var player2:Player2;
		private var ball:Ball = new Ball();
		
		private var fieldRadius:int = 250;
		private var shieldRadius:int = 50;
		private var ballRadius:int = 25;
		
		public static var centerPoint:Vector2D;
		
		private var player1Pos:Vector2D;
		private var player2Pos:Vector2D;
		private var ballPos:Vector2D;
		
		private var background:Background = new Background();
		private var status:Stats;
		private var hitDraw:Sprite;
		public var scoreDisplay:Score = new Score();
		
		private var game_Layer:Sprite = new Sprite();
		private var ui_Layer:Sprite = new Sprite();
		private var back_Layer:Sprite = new Sprite();
		private var backgroundArt:Background_Art = new Background_Art();
		public function Level() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function stopLoop(e:Event):void {
			removeEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function init(e:Event):void 
		{
			
			addChild(back_Layer);
			addChild(game_Layer);
			addChild(ui_Layer);
			back_Layer.addChild(backgroundArt);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			scoreDisplay.addEventListener(Score.ENDGAME, stopLoop)
			centerPoint = new Vector2D(stage.stageWidth / 2, (stage.stageHeight / 2) );
			
			scoreDisplay.x = (( -scoreDisplay.width / 2)+centerPoint.x);
			ui_Layer.addChild(scoreDisplay);
			back_Layer.addChild(background);
			
			player1 = new Player1(fieldRadius,shieldRadius);
			player2 = new Player2(fieldRadius,shieldRadius);
			
			//this.y += 50;
			
			player1.x = stage.stageWidth / 2;
			player2.x = stage.stageWidth / 2;
			player1.rotationZ = 180;
			player1.y = stage.stageHeight / 2;
			player2.y = stage.stageHeight / 2;
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			
			game_Layer.addChild(player1);
			game_Layer.addChild(player2);
			//addChild(ball);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyReleased);
			
			var field:Sprite = new Sprite();
			field.graphics.lineStyle(5, 0, 0.3);
			field.graphics.drawCircle(centerPoint.x, centerPoint.y, fieldRadius);
			graphics.lineStyle(5, 0xff0000);
			field.graphics.drawCircle(centerPoint.x, centerPoint.y, 5);
			addChild(field);
			Debug.test(function():void { hitDraw = new Sprite(); addChild(hitDraw); },Debug.Kit_bounce);
			Debug.test(function():void { status = new Stats(); addChild(status); }, Debug.ALL);
		}
		
		private function loop(e:Event):void 
		{
			
			//move
			ball.loop();
			player2.MovePlayer(Ikey, Kkey);
			player1.MovePlayer(Skey, Wkey);
			//
			background.drawFire(ball.x, ball.y , ball.Velocity.angle);
			
			//save positions
			player1Pos = calcPointOncircle(player1.rotationZ * Math.PI / 180, centerPoint.x, centerPoint.y, fieldRadius+shieldRadius-20);
			player2Pos = calcPointOncircle(player2.rotationZ * Math.PI / 180, centerPoint.x, centerPoint.y, fieldRadius+shieldRadius-20);
			ballPos = new Vector2D(ball.x, ball.y);
			
			//draw stuff
			graphics.clear();
			graphics.lineStyle(5);
			graphics.drawCircle(player2Pos.x, player2Pos.y, 5);
			graphics.lineStyle(5, 0xff0000);
			graphics.drawCircle(player1Pos.x, player1Pos.y, 5);
			
			//bounce
			if (ballPos.distance(centerPoint) < fieldRadius+ballRadius) {
				if (ballPos.distance(player1Pos) < shieldRadius+ballRadius) {
					Debug.test(function():void { trace("hit p1") } , Debug.Kit_bounce);
					ballBounce(player1Pos);
				}
				if (ballPos.distance(player2Pos) < shieldRadius+ballRadius) {
					Debug.test(function():void { trace("hit p2") } , Debug.Kit_bounce);
					ballBounce(player2Pos);
				}
			}else if(ball.ballOnField == true){
				//set score
				ball.ballOnField = false;
				if (ball.x>centerPoint.x) {
					scoreDisplay.UpdateScore(1,0);
				}else {
					scoreDisplay.UpdateScore(0,1);
				}
			}
			//update timer
			scoreDisplay.updateTimer();
			
			//remove ball if out off field
			if (ballPos.distance(centerPoint) > fieldRadius * 2) {
				//reset ball
				ball.ballOnField = true;
				ball.x = centerPoint.x;
				ball.y = centerPoint.y;
				Debug.test(function():void { hitDraw.graphics.clear(); } , Debug.Kit_bounce);
			}
		}
		
		private function ballBounce(playPos:Vector2D): void {
			var vectorDistanceBallPlayer:Vector2D = new Vector2D(ball.x - playPos.x, ball.y - playPos.y);
			//var vectorDistancePlayerBall:Vector2D = new Vector2D(playPos.x - ball.x, playPos.y - ball.y);
			
			//bounce calculate
			var ballreverse:Vector2D = new Vector2D( -ball.Velocity.x, -ball.Velocity.y);
			var ballAngle:Number = ballreverse.angle ;
			var normlAngle:Number = vectorDistanceBallPlayer.angle;
			var deltaAngle:Number = normlAngle -ballAngle ;
			var newAngele:Number = normlAngle + deltaAngle ;
			if (newAngele > Math.PI) {
				newAngele - (Math.PI * 2);
			}else if (newAngele < -Math.PI) {
				newAngele + (Math.PI * 2);
			}
			ball.Velocity.angle = newAngele;
			
			Debug.test(function():void { 
				//draw normal line
				var lineDraw:Sprite = new Sprite();
				lineDraw.x = ball.x; 
				lineDraw.y = ball.y;
				hitDraw.addChild(lineDraw);
				vectorDistanceBallPlayer.drawVector(lineDraw.graphics);
				//print info
				trace("In: " + ballreverse.angle );
				trace("normal: " + vectorDistanceBallPlayer.angle );
				trace("OUT: " + ball.Velocity.angle );
			} , Debug.Kit_bounce);
			
			//set ball out off player
			var newPlayerPos:Vector2D = new Vector2D(); 
			var spawnDistance:Vector2D = new Vector2D();
			spawnDistance.add(vectorDistanceBallPlayer);
			spawnDistance.normalcate(ballRadius + shieldRadius + 2);
			newPlayerPos.add(spawnDistance.add(playPos));
			ball.x = newPlayerPos.x;
			ball.y = newPlayerPos.y;
		}
		
		public function calcPointOncircle(rotation:Number, cx:int, cy:int,radius:int):Vector2D {
			var x:Number = cx + radius * Math.cos(rotation);
			var y:Number = cy + radius * Math.sin(rotation);
			return new Vector2D(x,y);
		}
		
		public function KeyPressed(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				//  W
				case 87:
				Wkey = true;
				break;
				//  S
				case 83:
				Skey = true;
				break;
				//  I
				case 73:
				Ikey = true;
				break;
				//  K
				case 75:
				Kkey = true;
				break;
			}
		}
		
		public function KeyReleased(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				//  W
				case 87:
				Wkey = false;
				break;
				//  S
				case 83:
				Skey = false;
				break;
				//  I
				case 73:
				Ikey = false;
				break;
				//  K
				case 75:
				Kkey = false;
				break;
			}
		}
	}

}