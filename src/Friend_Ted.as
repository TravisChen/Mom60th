package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Friend_Ted extends Friend
	{
		[Embed(source="data/ted-anim.png")] private var ImgPlayer:Class;
		
		public function Friend_Ted(X:int,Y:int,player:Player,active:Boolean)
		{
			message = "\"Surprise!!!\"";
			message2 = "\"For my Dearest Eileen, I will always be here to \ngive you hugs and kisses, and to love you to \neternity. Happy 60th Birthday my Darling!\"";
			super(X,Y,player,active,180,0);
			loadGraphic(ImgPlayer,true,true,128,128);

			width = 128;
			height = 128;
			offset.x = width/2;
			offset.y = height;
			
			doPop = true;

			addAnimation("run", [12,13,14,15,16,17,18,19,20,21], 50);
			addAnimation("idle", [12,13,14,15,16,17,18,19,20,21], 20);
			addAnimation("pop", [0,1,2,3,4,5,6,7,8,9], 20);
			addAnimation("pop_idle", [0,1], 20);
			addAnimation("talk", [12,13,14,15,16,17,18,19,20,21], 20);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}