package
{
	import org.flixel.*;
	
	public class Friend_Cali extends Friend
	{
		[Embed(source="data/cali-anim.png")] private var ImgPlayer:Class;
		
		public function Friend_Cali(X:int,Y:int,player:Player,active:Boolean)
		{
			message = "\"Bark bark bark!\"";
			super(X,Y,player,active,32,-12);
			loadGraphic(ImgPlayer,true,true,64,64);

			addAnimation("run", [0,1,2,3,4,5,6,7], 30);
			addAnimation("idle", [9,10,11,12,13], 20);
			addAnimation("talk", [15,16,17,18,19,20,21,22], 20);
			
			this.facing = LEFT;
		}
		
		override public function update():void
		{
			super.update();
			
			if( _attached )
			{
				if( _player.facing == LEFT )
				{
					this.facing = RIGHT;
				}
				
				if( _player.facing == RIGHT )
				{
					this.facing = LEFT;
				}
			}
		}
	}
}