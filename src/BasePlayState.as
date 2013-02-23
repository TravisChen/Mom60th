package
{
	import flash.display.*;
	
	import org.flixel.*;
	
	public class BasePlayState extends FlxState
	{
		public static var levelArray:Array = [
			Level_Menu,
			Level_Friend_Cali,
			Level_Friend_Travis,
			Level_Friend_Tyler,
			Level_Friend_Roth,
			Level_Friend_Booth,
			Level_Friend_Mary,
			Level_Friend_Ted,
			Level_End
		]
		
		public function BasePlayState():void
		{
		}
	}
}
