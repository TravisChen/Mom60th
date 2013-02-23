package
{
	import org.flixel.*;
	
	public class Friend_Travis extends Friend
	{
		[Embed(source="data/travis-anim.png")] private var ImgPlayer:Class;
		
		public function Friend_Travis(X:int,Y:int,player:Player,active:Boolean)
		{
			message = "\"Hey MOM! it's Travis! Welcome to your own birthday \nvideogame! Thank you always for the loving, caring \nand wise upbringing. LOVE YOU AND HAPPY BIRTHDAY!\"";
			message2 = "\"And... thanks for letting little Travis play as \nmany videogames as his heart desired.\" \n\n\"A cast of characters await you, good luck!\"";
			super(X,Y,player,active,50,8);
			loadGraphic(ImgPlayer,true,true,64,64);

			addAnimation("run", [0,1,2,3,4,5,6,7,8,9,10,11,12], 50);
			addAnimation("idle", [16,17,18,19,20,21,22,23,24,25,27,28], 20);

			addAnimation("talk", [32,33,34,36,37,38], 20);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}