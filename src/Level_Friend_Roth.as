package    {
		
	import org.flixel.*;
	
	public class Level_Friend_Roth extends Level_Main{
	
		public function Level_Friend_Roth( group:FlxGroup ) {
			super( group );
		
			// Create friend
			friend = new Friend_Roth(levelSizeX*4/5,FlxG.height*11/12,player,true);
			PlayState.groupPlayer.add(friend);
			
			var travis:Friend = new Friend_Travis(0,0,player,false);
			PlayState.groupPlayer.add(travis);
			
			var cali:Friend_Cali = new Friend_Cali(0,0,player,false);
			PlayState.groupPlayer.add(cali);
			
			var tyler:Friend_Tyler = new Friend_Tyler(0,0,player,false);
			PlayState.groupPlayer.add(tyler);
		}
	
		override public function update():void
		{	
			super.update();
		}
	}
}
