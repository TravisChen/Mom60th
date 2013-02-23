package
{
	import org.flixel.*; 
	[SWF(width="1280", height="800", backgroundColor="#000000")] 
	
	public class Mom60th extends FlxGame
	{
		[Embed(source = '../data/song.mp3')] private var SndSong:Class;
		
		public static var songPlaying:Boolean = false;
		public static var pastFirstScreen:Boolean = false;
		public static var currLevelIndex:uint = 0;
		
		public function Mom60th()
		{

			super(320,200,PlayState,4);
		}
		
		override public function switchState():void
		{
			if( !songPlaying && pastFirstScreen )
			{
				FlxG.playMusic(SndSong,0.5);
				songPlaying = true;
			}
			pastFirstScreen = true;
			super.switchState();
		}
	}
}