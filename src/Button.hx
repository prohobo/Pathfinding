package ;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

/**
 * ...
 * @author Alex Klos
 */
class Button extends Sprite
{
	private var gfx:Sprite;
	private var highlight:Bitmap;
	
	public function new(_gfx:Sprite, _text:String) 
	{
		super();
		gfx = _gfx;
		this.blendMode = BlendMode.LAYER;
		
		highlight = new Bitmap(new BitmapData(Std.int(gfx.width), Std.int(gfx.height), true));
		highlight.blendMode = BlendMode.OVERLAY;
		
		gfx.buttonMode = true;
		addChild(gfx);
		
		var tf:TextFormat = new TextFormat();
		tf.font = "SSP-Black";
		tf.color = 0x323232;
		tf.size = 16;
		
		var txt:TextField = new TextField();
		txt.text = _text;
		txt.mouseEnabled = false;
		txt.embedFonts = true;
		txt.autoSize = TextFieldAutoSize.CENTER;
		txt.setTextFormat(tf);
		txt.x = gfx.width / 2 - txt.width / 2;
		txt.y = gfx.height / 2 - txt.height / 2;
		addChild(txt);
		
		addChild(highlight);
		highlight.visible = true;
		
		addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
		addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
	}
	
	private function OnMouseDown(e:MouseEvent)
	{
		highlight.visible = false;
	}
	
	private function OnMouseUp(e:MouseEvent)
	{
		highlight.visible = true;
	}
	
}