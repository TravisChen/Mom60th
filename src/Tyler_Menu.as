package
{
	import org.flixel.*;
	
	public class Tyler_Menu extends FlxSprite
	{
		[Embed(source="data/tyler-anim.png")] private var ImgPlayer:Class;
		
		public function Tyler_Menu(X:int,Y:int)
		{
			super(X,Y);
			loadGraphic(ImgPlayer,true,true,64,64);

			// Bounding box tweaks
			width = 64;
			height = 64;
			offset.x = width/2;
			offset.y = height;
			
			addAnimation("idle", [16,17,18,19,20,21,22,23,24,25,27,28], 20);
		}

		override public function update():void
		{			
			super.update();
			play("idle");
		}
	}
}