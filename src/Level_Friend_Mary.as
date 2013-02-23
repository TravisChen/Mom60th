package    {
		
	import org.flixel.*;
	
	public class Level_Friend_Mary extends Level_Main{
	
		public function Level_Friend_Mary( group:FlxGroup ) {
			super( group );
			
			var roth:Friend_Roth = new Friend_Roth(0,0,player,false);
			PlayState.groupPlayer.add(roth);
			
			var travis:Friend = new Friend_Travis(0,0,player,false);
			PlayState.groupPlayer.add(travis);
			
			var cali:Friend_Cali = new Friend_Cali(0,0,player,false);
			PlayState.groupPlayer.add(cali);
			
			var tyler:Friend_Tyler = new Friend_Tyler(0,0,player,false);
			PlayState.groupPlayer.add(tyler);

			friend = new Friend_Mary(levelSizeX*4/5,FlxG.height*11/12,player,true);
			PlayState.groupPlayer.add(friend);
			
			var booth:Friend_Booth = new Friend_Booth(0,0,player,false);
			PlayState.groupPlayer.add(booth);

		}
	
		override public function update():void
		{	
			super.update();
		}
	}
}
