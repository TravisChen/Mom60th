package
{
	import org.flixel.*;
	
	public class Friend_Tyler extends Friend
	{
		[Embed(source="data/tyler-anim.png")] private var ImgPlayer:Class;
		
		public function Friend_Tyler(X:int,Y:int,player:Player,active:Boolean)
		{
			message = "\"Hey mom! My names Tyler! I'm your other son! \nThanks for all the talks, stories, love, and \nmotherly advice you've given me throughout the \nyears. I'll cherish them forever and can't wait \nto have some more!\"";
			super(X,Y,player,active,74,-8);
			loadGraphic(ImgPlayer,true,true,64,64);

			addAnimation("run", [0,1,2,3,4,5,6,7,8,9,10,11,12], 50);
			addAnimation("idle", [16,17,18,19,20,21,22,23,24,25,27,28], 20);
			addAnimation("talk", [32,33,34,36,37,38], 10);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}