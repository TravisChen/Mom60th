package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Friend_Mary extends Friend
	{
		[Embed(source="data/mary-anim.png")] private var ImgPlayer:Class;
		
		public function Friend_Mary(X:int,Y:int,player:Player,active:Boolean)
		{
			message = "\"Hey darling. Its your motha! I'm excited for april \nso we can see where you and Ted got married. \nI love you so much!\"";
			super(X,Y,player,active,132,17);
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