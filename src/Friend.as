package
{
	import org.flixel.*;
	
	public class Friend extends FlxSprite
	{
		[Embed(source = '../data/text-prompt.png')] private var ImgTextPrompt:Class;
		[Embed(source = '../data/wasd.png')] private var ImgWasd:Class;
		
		private var _player:Player;
		private var _friendText:FlxText;
		private var _textPrompt:FlxSprite;
		private var _readTime:Number = 3.0;
		private var _sawText:Boolean = false;
		private var _attached:Boolean = false;
		
		public var wasd:FlxSprite;
		public var wasdFadeInTime:Number;
		public var wasdBounceTime:Number;
		public var wasdBounceToggle:Boolean;
		
		public var message:String;
		public var isActiveFriend:Boolean;
		public var _attachOffsetX:int;
		public var _attachOffsetY:int;
		
		public function Friend(X:int,Y:int,player:Player,activeFriend:Boolean, attachOffsetX:int, attachOffsetY:int)
		{
			super(X,Y);
			
			isActiveFriend = activeFriend;
			_player = player;
			
			_attachOffsetX = attachOffsetX;
			_attachOffsetY = attachOffsetY;
			
			// Bounding box tweaks
			width = 64;
			height = 64;
			offset.x = width/2;
			offset.y = height;
			
			if( isActiveFriend )
			{
				_textPrompt = new FlxSprite(0,0);
				_textPrompt.loadGraphic(ImgTextPrompt, true, true, 320, 200);
				_textPrompt.scrollFactor.x = _textPrompt.scrollFactor.y = 0;
				_textPrompt.visible = false;
				PlayState.groupForeground.add(_textPrompt);
				
				_friendText = new FlxText(0, 4, FlxG.width, message);
				_friendText.setFormat(null,8,0xFFFFFF,"center");
				_friendText.visible = false;
				_friendText.scrollFactor.x = _friendText.scrollFactor.y = 0;
				PlayState.groupForeground.add(_friendText);
				
				createWasd();				
			}
			else
			{
				_attached = true;				
			}
		}
		
		public function createWasd():void {
			
			// Create wasd
			wasd = new FlxSprite(0,0);
			wasd.loadGraphic(ImgWasd, true, true, 32, 32);	
			wasd.scrollFactor.x = wasd.scrollFactor.y = 0;
			wasd.x = FlxG.width - 36;
			wasd.y = 40;
			wasd.alpha = 0;
			
			// Add to foreground
			PlayState.groupForeground.add(wasd);
			
			// Timer
			wasdFadeInTime = 0.1;
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
			if( _attached )
			{
				x = _player.x - _attachOffsetX;
				y = _player.y - _attachOffsetY;
			
				if( _player.facing == LEFT )
				{
					this.facing = LEFT;
				}
				
				if( _player.facing == RIGHT )
				{
					this.facing = RIGHT;
				}
							
				if( _player.walking )
				{
					play( "run" );
				}
				else
				{
					play( "idle" );					
				}
				
				if( _player.paused )
				{
					play( "idle" );
				}
			}
			else
			{
				play( "idle" );
			}
			
			if( isActiveFriend )
			{
				if( !_sawText )
				{
					if( _player.overlaps(this) )
					{
						_friendText.visible = true;
						_textPrompt.visible = true;
						_player.paused = true;
					}
					
					if( _friendText.visible )
					{
						_readTime -= FlxG.elapsed;
						if( _readTime <= 0 )
						{
							updateWasd();
		
							if(FlxG.keys.UP || FlxG.keys.DOWN || FlxG.keys.LEFT || FlxG.keys.RIGHT ||
							   FlxG.keys.W || FlxG.keys.A || FlxG.keys.S || FlxG.keys.D)
							{
								_friendText.visible = false;
								_textPrompt.visible = false;
								_player.paused = false;
								wasd.visible = false;
								
								_sawText = true;
								_attached = true;
							}
						}
					}
				}
			}
		}
	}
}