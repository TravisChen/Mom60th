package    {
		
	import org.flixel.*;
	
	public class Level_Friend_Ted extends Level_Main{
	
		public function Level_Friend_Ted( group:FlxGroup ) {
			super( group );
			
			// Create friend
			friend = new Friend_Ted(levelSizeX*4/5,FlxG.height*11/12,player,true,74,5);
			PlayState.groupPlayer.add(friend);
		
			var cali:Friend_Cali = new Friend_Cali(0,0,player,false,50,-5);
			PlayState.groupPlayer.add(cali);
		}
	
		override public function update():void
		{	
			super.update();
		}
	}
}
