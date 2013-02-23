package
{
	import org.flixel.*;
	
	public class Friend_Cali extends Friend
	{
		[Embed(source="data/cali-anim.png")] private var ImgPlayer:Class;
		
		public function Friend_Cali(X:int,Y:int,player:Player,active:Boolean,offsetX:int,offsetY:int)
		{
			message = "\"Bark bark bark!!\"";
			super(X,Y,player,active,offsetX,offsetY);
			loadGraphic(ImgPlayer,true,true,64,64);
			
			addAnimation("idle", [16,17,18,19,20,21,22,23,24,25,27,28], 20);
			addAnimation("run", [0,1,2,3,4,5,6,7,8,9,10,11,12], 50);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}