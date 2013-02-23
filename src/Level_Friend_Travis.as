package    {
		
	import org.flixel.*;
	
	public class Level_Friend_Travis extends Level_Main{
	
		public function Level_Friend_Travis( group:FlxGroup ) {
			super( group );
			
			// Create friend
			friend = new Friend_Travis(levelSizeX*4/5,FlxG.height*11/12,player,true);
			PlayState.groupPlayer.add(friend);
		
			var cali:Friend_Cali = new Friend_Cali(0,0,player,false);
			PlayState.groupPlayer.add(cali);
		}
	
		override public function update():void
		{	
			super.update();
		}
	}
}
