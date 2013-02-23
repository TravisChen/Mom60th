package    {
		
	import org.flixel.*;
	
	public class Level_Friend_Tyler extends Level_Main{
	
		public function Level_Friend_Tyler( group:FlxGroup ) {
			super( group );
		
			var travis:Friend = new Friend_Travis(0,0,player,false);
			PlayState.groupPlayer.add(travis);
			
			var cali:Friend_Cali = new Friend_Cali(0,0,player,false);
			PlayState.groupPlayer.add(cali);
			
			// Create friend
			friend = new Friend_Tyler(levelSizeX*4/5,FlxG.height*11/12,player,true);
			PlayState.groupPlayer.add(friend);
		}
	
		override public function update():void
		{	
			super.update();
		}
	}
}
