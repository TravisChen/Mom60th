package    {
	
	import org.flixel.*;
	
	public class Level_End extends Level{
		
		[Embed(source = '../data/wasd.png')] private var ImgWasd:Class;
		[Embed(source = '../data/menu-background.png')] private var ImgBackground:Class;
		
		public var wasd:FlxSprite;
		public var wasdFadeInTime:Number;
		public var wasdBounceTime:Number;
		public var wasdBounceToggle:Boolean;
		
		public var startTime:Number;
		
		public var travisMenu:Travis_Menu;
		public var tylerMenu:Tyler_Menu;
		
		public function Level_End( group:FlxGroup ) {
			
			super();
			
			levelSizeX = 320;
			levelSizeY = 200;
			
			startTime = 5.0;
			
			// Create player
			travisMenu = new Travis_Menu(FlxG.width/2 - 32,FlxG.height/2 + 76);
			PlayState.groupPlayer.add(travisMenu);
			
			tylerMenu = new Tyler_Menu(FlxG.width/2 + 32,FlxG.height/2 + 76);
			PlayState.groupPlayer.add(tylerMenu);
			
			createForegroundAndBackground();
		}
		
		override public function nextLevel():Boolean
		{
			if( startTime > 0 )
			{
				startTime -= FlxG.elapsed;
				return false;
			}
			
			if( FlxG.keys.UP || FlxG.keys.DOWN || FlxG.keys.LEFT || FlxG.keys.RIGHT ||
				FlxG.keys.W || FlxG.keys.A || FlxG.keys.S || FlxG.keys.D)
			{
				return true;
			}
			return false;
		}
		
		public function createForegroundAndBackground():void 
		{	
			// Create wasd
			createWasd();
			
			var background:FlxSprite;
			background = new FlxSprite(0,0);
			background.loadGraphic(ImgBackground, true, true, levelSizeX, levelSizeY);	
			PlayState.groupBackground.add(background);
			
			var bdayText:FlxText = new FlxText(0, 10, FlxG.width, "LOVE");
			bdayText.setFormat(null,16,0xFFFFFF,"center");
			PlayState.groupForeground.add(bdayText);
			
			var bdayText2:FlxText = new FlxText(0, 32, FlxG.width, "TRAVIS & TYLER!");
			bdayText2.setFormat(null,16,0xFFFFFF,"center");
			PlayState.groupForeground.add(bdayText2);
		}
			
		public function createWasd():void {
			// Create wasd
			wasd = new FlxSprite(0,0);
			wasd.loadGraphic(ImgWasd, true, true, 32, 32);	
			wasd.x = FlxG.width/2 - 16;
			wasd.y = FlxG.height - 24;
			wasd.alpha = 0;
			
			// Add to foreground
			PlayState.groupForeground.add(wasd);
			
			// Timer
			wasdFadeInTime = 5.0;
			wasdBounceToggle = true;
			wasdBounceTime = 0;
		}
		
		public function updateWasd():void 
		{		
			if( wasdFadeInTime <= 0 )
			{
				if( wasd.alpha < 1 )
				{
					wasd.alpha += 0.025;		
				}
				else
				{
					if( wasdBounceTime <= 0 )
					{
						wasdBounceTime = 0.02;
						if( wasdBounceToggle )
						{
							wasd.y += 1;
							wasdBounceToggle = false;
						}
						else
						{
							wasd.y -= 1;
							wasdBounceToggle = true;
						}
					}
					else
					{
						wasdBounceTime -= FlxG.elapsed;
					}
				}
			}
			else
			{
				wasdFadeInTime -= FlxG.elapsed;
			}
		}
		
		override public function update():void
		{			
			updateWasd();
			
			super.update();
		}	
	}
}
