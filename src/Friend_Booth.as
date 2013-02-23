package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Friend_Booth extends Friend
	{
		[Embed(source="data/booth-anim.png")] private var ImgPlayer:Class;
		
		public function Friend_Booth(X:int,Y:int,player:Player,active:Boolean)
		{
			message = "\"Hey Bugsy, another basket of rolls? \nor more rolls?\", says Steve";
			message2 = "\"Sigma pi men are best, but how bout you and me \njust go to andros?\", asks Fran\n\n\"We love you Eileen!\", they both shout!";
			super(X,Y,player,active,120,-15);
			loadGraphic(ImgPlayer,true,true,100,64);
			
			width = 100;
			offset.x = width/2;

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