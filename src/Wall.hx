package ;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

/**
 * ...
 * @author Alex Klos
 */
class Wall extends Sprite
{
	private var gfx:Sprite;
	
	public function new(_x:Float, _y:Float) 
	{
		super();
		x = _x;
		y = _y;
		
		gfx = new Sprite();
		
		var bmp:Bitmap = new Bitmap(new BitmapData(GV.nodeSize, GV.nodeSize, true, 0xFFc3c3c3));
		gfx.addChild(bmp);
		addChild(gfx);
		
		GV.walls.push(this);
	}
	
}