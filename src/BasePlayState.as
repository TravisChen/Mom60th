package
{
	import flash.display.*;
	
	import org.flixel.*;
	
	public class BasePlayState extends FlxState
	{
		public static var levelArray:Array = [
			Level_Menu,
			Level_Friend_Cali,
			Level_Friend_Ted
		]
		
		public function BasePlayState():void
		{
		}
	}
}
