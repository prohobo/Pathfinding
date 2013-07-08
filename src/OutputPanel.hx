package ;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

/**
 * ...
 * @author Alex Klos
 */
class OutputPanel extends Sprite
{

	public function new() 
	{
		super();
		
		x = 200;
		y = 420;
		
		var panel:Bitmap = new Bitmap(new BitmapData(600, 60, true, 0xff212121));
		addChild(panel);
	}
	
}