package    {
		
	import org.flixel.*;
	
	public class Level_Main extends Level{
	
		[Embed(source = '../data/background.png')] private var ImgSky:Class;
		[Embed(source = '../data/clouds1.png')] private var ImgClouds1:Class;
		[Embed(source = '../data/clouds2.png')] private var ImgClouds2:Class;
		[Embed(source = '../data/clouds3.png')] private var ImgClouds3:Class;
		[Embed(source = '../data/foreground.png')] private var ImgForeground:Class;
		
		// Points
		private var pointsText:FlxText;

		// Timer
		public var startTime:Number;
		public var endTime:Number;
		private var timerText:FlxText;

		// Round End
		private var roundEnd:Boolean;
		private var roundEndContinueText:FlxText;
		private var roundEndPointsText:FlxText;
		
		// Consts
		public const MAX_TIME:uint = 10;
		public const TEXT_COLOR:uint = 0xFF555555;
		
		public function Level_Main( group:FlxGroup ) {
			
			levelSizeX = 714;
			levelSizeY = 200;

			// Create player
			player = new Player(FlxG.height*1/4,FlxG.height*11/12);
			PlayState.groupPlayer.add(player);
			PlayState._currLevel.player = player;

//			// Create enemy
//			enemy = new Enemy(FlxG.height*3/4,FlxG.height/2);
//			PlayState.groupPlayer.add(enemy);
			
			createForegroundAndBackground();
			
			// Timer
//			startTime = 1.0;
//			endTime = 3.0;
//			timer = MAX_TIME;
//			timerText = new FlxText(0, 0, FlxG.width, "0:00");
//			timerText.setFormat(null,16,TEXT_COLOR,"left");
//			timerText.scrollFactor.x = timerText.scrollFactor.y = 0;
//			PlayState.groupBackground.add(timerText);
			
			// Points
//			points = 0;
//			pointsText = new FlxText(0, 0, FlxG.width, "0");
//			pointsText.setFormat(null,8,TEXT_COLOR,"center");
//			pointsText.scrollFactor.x = pointsText.scrollFactor.y = 0;
//			PlayState.groupBackground.add(pointsText);
			
			// Round end
			roundEnd = false;
			buildRoundEnd();
			
			super();
		}
		
		public function createForegroundAndBackground():void {
			var skySprite:FlxSprite;
			skySprite = new FlxSprite(0,0);
			skySprite.loadGraphic(ImgSky, true, true, levelSizeX, levelSizeY);	
			PlayState.groupBackground.add(skySprite);
			
			var clouds1:FlxSprite;
			clouds1 = new FlxSprite(0,0);
			clouds1.scrollFactor.x = clouds1.scrollFactor.y = 0.3;
			clouds1.loadGraphic(ImgClouds1, true, true, levelSizeX, levelSizeY);	
			PlayState.groupClouds.add(clouds1);
			
			var clouds2:FlxSprite;
			clouds2 = new FlxSprite(0,0);
			clouds2.scrollFactor.x = clouds2.scrollFactor.y = 0.2;
			clouds2.loadGraphic(ImgClouds2, true, true, levelSizeX, levelSizeY);	
			PlayState.groupClouds.add(clouds2);
			
			var clouds3:FlxSprite;
			clouds3 = new FlxSprite(0,0);
			clouds3.scrollFactor.x = clouds3.scrollFactor.y = 0.1;
			clouds3.loadGraphic(ImgClouds3, true, true, levelSizeX, levelSizeY);	
			PlayState.groupClouds.add(clouds3);
			
			var foregroundSprite:FlxSprite;
			foregroundSprite = new FlxSprite(0,0);
			foregroundSprite.loadGraphic(ImgForeground, true, true, levelSizeX, levelSizeY);	
			PlayState.groupForeground.add(foregroundSprite);
			
//			var backgroundSprite:FlxSprite;
//			backgroundSprite = new FlxSprite(0,0);
//			backgroundSprite.loadGraphic(ImgBackground, true, true, levelSizeX, levelSizeY);	
//			PlayState.groupTilemap.add(backgroundSprite);
		}
		
		public function buildRoundEnd():void {
			roundEndContinueText = new FlxText(0, FlxG.height - 16, FlxG.width, "PRESS ANY KEY TO CONTINUE");
			roundEndContinueText.setFormat(null,8,TEXT_COLOR,"center");
			roundEndContinueText.scrollFactor.x = roundEndContinueText.scrollFactor.y = 0;	
			roundEndContinueText.visible = false;
			PlayState.groupForeground.add(roundEndContinueText);
			
			roundEndPointsText = new FlxText(0, FlxG.height - 48, FlxG.width, "0");
			roundEndPointsText.setFormat(null,16,TEXT_COLOR,"center");
			roundEndPointsText.scrollFactor.x = roundEndContinueText.scrollFactor.y = 0;	
			roundEndPointsText.visible = false;
			PlayState.groupForeground.add(roundEndPointsText);
		}
		
		private function updateTimer():void
		{
			// Timer
			var minutes:uint = timer/60;
			var seconds:uint = timer - minutes*60;
			if( startTime <= 0 )
			{
				timer -= FlxG.elapsed;
			}
			else
			{
				startTime -= FlxG.elapsed;
			}
			
			// Check round end
			if( timer <= 0 )
			{
				showEndPrompt();
				if( endTime <= 0 )
				{
					checkAnyKey();					
				}
				else
				{
					endTime -= FlxG.elapsed;
				}
				return;
			}
			
			// Update timer text
			if( seconds < 10 )
				timerText.text = "" + minutes + ":0" + seconds;
			else
				timerText.text = "" + minutes + ":" + seconds;
		}
		
		override public function update():void
		{	
			// Timer
//			updateTimer();

			// Update points text
//			pointsText.text = "" + points + " (" + PlayState._currLevel.multiplier + "x)";
//			roundEndPointsText.text = "" + points;
			
			super.update();
		}
		
		private function showEndPrompt():void 
		{
			PlayState._currLevel.player.roundOver = true;
			roundEndPointsText.visible = true;
		}
		
		private function checkAnyKey():void 
		{
			roundEndContinueText.visible = true;
			if (FlxG.keys.any())
			{
				roundEnd = true;
			}		
		}
		
		override public function nextLevel():Boolean
		{
			if( roundEnd )
			{
				return true;
			}
			return false;
		}
	}
}
