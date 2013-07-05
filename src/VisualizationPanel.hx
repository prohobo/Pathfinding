package ;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

/**
 * ...
 * @author Alex Klos
 */
class VisualizationPanel extends Sprite
{

	public function new() 
	{
		super();
		
		x = 200;
		
		var panel:Bitmap = new Bitmap(new BitmapData(600, 420, true, 0xff262334));
		addChild(panel);
	}
	
}