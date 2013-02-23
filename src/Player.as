package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source="data/mom-anim.png")] private var ImgPlayer:Class;
		
		public var startTime:Number;
		
		public var roundOver:Boolean;
		
		public var paused:Boolean = false;
		
		public var walking:Boolean = false;
		
		public function Player(X:int,Y:int)
		{
			super(X,Y);
			loadGraphic(ImgPlayer,true,true,64,64);

			// Bounding box tweaks
			width = 64;
			height = 64;
			offset.x = width/2;
			offset.y = height;
			
			// Init
			roundOver = false;
			
			// Basic player physics
			var runSpeed:uint = 140;
			drag.x = runSpeed*8;
			drag.y = runSpeed*8;
			maxVelocity.x = runSpeed;
			maxVelocity.y = runSpeed;
			
			facing = LEFT;
			
			// Gravity
			acceleration.y = 0;
			
			addAnimation("idle", [16,17,18,19,20,21,22,23,24,25,27,28], 20);
			addAnimation("run", [0,1,2,3,4,5,6,7,8,9,10,11,12], 50);
		}

		override public function update():void
		{	
			super.update();
			
			if( paused )
			{
				velocity.x = 0;
				velocity.y = 0;
				acceleration.x = 0;
				acceleration.y = 0;

				play("idle");
				return;
			}

			if( x <= 0 )
			{
				x = 0;
			}
			
			if( x >= PlayState._currLevel.levelSizeX )
			{
				x = PlayState._currLevel.levelSizeX;
			}
			
			if( y >= PlayState._currLevel.levelSizeY )
			{
				y = PlayState._currLevel.levelSizeY;			
			}
			
			if( y <= PlayState._currLevel.levelSizeY * 7/8 )
			{
				y = PlayState._currLevel.levelSizeY  * 7/8;	
			}
			
			if( startTime > 0 )
			{
				startTime -= FlxG.elapsed;
				return;
			}
			
			if( roundOver )
			{
				play("idle");
				return;
			}
			
			// MOVEMENT Left, Right
			acceleration.x = 0;
			acceleration.y = 0;
			if(FlxG.keys.LEFT || FlxG.keys.A)
			{
				facing = RIGHT;
				acceleration.x -= drag.x;
			}
			else if(FlxG.keys.RIGHT || FlxG.keys.D)
			{
				facing = LEFT;
				acceleration.x += drag.x;
			}
			
			// MOVEMENT Up, Down
			if(FlxG.keys.UP || FlxG.keys.W)
			{
				acceleration.y -= drag.y;
			}
			else if(FlxG.keys.DOWN || FlxG.keys.S)
			{
				acceleration.y += drag.y;
			}
		
			if(velocity.x == 0 && velocity.y == 0 )
			{
				walking = false;
				play("idle");
			}
			else
			{
				walking = true;
				play("run");
			}
		}
	}
}