package
{
	import org.flixel.*; 
	[SWF(width="1280", height="800", backgroundColor="#000000")] 
	
	public class Mom60th extends FlxGame
	{
		public static var currLevelIndex:uint = 0;
		
		public function Mom60th()
		{
			super(320,200,PlayState,4);
		}
	}
}