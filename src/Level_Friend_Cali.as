package    {
		
	import org.flixel.*;
	
	public class Level_Friend_Cali extends Level_Main{
	
		public function Level_Friend_Cali( group:FlxGroup ) {
			super( group );
			
			// Create friend
			friend = new Friend_Cali(levelSizeX*4/5,FlxG.height*11/12,player,true,50, -5);
			PlayState.groupPlayer.add(friend);
		}
	
		override public function update():void
		{	
			super.update();
		}
	}
}
