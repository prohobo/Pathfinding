package ;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.filters.BitmapFilterQuality;
import flash.filters.GlowFilter;

/**
 * ...
 * @author Alex Klos
 */
class Agent extends Sprite
{
	private var body:Sprite;
	
	public function new(_x:Float, _y:Float) 
	{
		super();
		x = _x;
		y = _y;
		
		body = new Sprite();
		body.graphics.beginFill(Std.int(Math.random() * 0xffffff), 0.2);
		body.graphics.drawCircle(0, 0, 6);
		body.graphics.endFill();
		body.graphics.lineStyle(1, 0xffffff);
		body.graphics.beginFill(0x000000, 0);
		body.graphics.drawCircle(0, 0, 6);
		body.graphics.endFill();
		addChild(body);
	}
	
}