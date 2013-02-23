package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Friend_Roth extends Friend
	{
		[Embed(source="data/roth-anim.png")] private var ImgPlayer:Class;
		
		public function Friend_Roth(X:int,Y:int,player:Player,active:Boolean)
		{
			message = "\"Hello Eileen! Its the rothchild family!!! \nTo one of the most cheerful and beautiful people \nwe know, we wish you a very happy milestone birthday \ncelebration with your family!\"";
			message2 = "\"We hope you will continue celebrating your special \nbirthday throughout the year.  Here’s to the next \ndecade may it be filled with family, friends, \nlots of joyful times, and more special moments!\"";
			super(X,Y,player,active,95,5);
			loadGraphic(ImgPlayer,true,true,64,160);
			
			offset.y = 160;

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