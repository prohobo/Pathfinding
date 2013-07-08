package ui;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

/**
 * ...
 * @author Alex Klos
 */
class SlideBar extends Sprite
{
	private var slider:Sprite;
	private var slideTrack:Sprite;
	
	private var min:Int;
	private var max:Int;
	
	public var value:Float;
	
	private var valText:TextField;
	private var tf:TextFormat;
	
	public function new(_min:Int, _max:Int) 
	{
		super();
		min = _min;
		max = _max;
		value = min;
		
		buttonMode = true;
		
		slideTrack = new Sprite();
		var stBmp:Bitmap = new Bitmap(new BitmapData(180, 10, true, 0xff939393));
		slideTrack.addChild(stBmp);
		
		slider = new Sprite();
		var sBmp:Bitmap = new Bitmap(new BitmapData(10, 20, true, 0xffe3e3e3));
		slider.addChild(sBmp);
		
		slideTrack.y = slider.height / 2 - slideTrack.height / 2;
		addChild(slideTrack);
		addChild(slider);
		
		tf = new TextFormat();
		tf.font = "SSP-Regular";
		tf.color = 0xc3c3c3;
		tf.size = 16;
		
		valText = new TextField();
		valText.text = Std.string(value);
		valText.autoSize = TextFieldAutoSize.CENTER;
		valText.embedFonts = true;
		valText.mouseEnabled = false;
		valText.setTextFormat(tf);
		valText.x = slideTrack.width / 2 - valText.width / 2;
		valText.y = 20;
		addChild(valText);
		
		addEventListener(Event.ADDED_TO_STAGE, OnAdded);
		addEventListener(Event.REMOVED_FROM_STAGE, OnRemoved);
	}
	
	private function OnAdded(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, OnAdded);
		addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
	}
	
	private function OnMouseDown(e:MouseEvent)
	{
		if (hasEventListener(MouseEvent.MOUSE_MOVE) == false)
			addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
	}
	
	private function OnMouseMove(e:MouseEvent)
	{
		slider.x = mouseX - slider.width / 2;
		if (slider.x > slideTrack.width - slider.width)
			slider.x = slideTrack.width - slider.width;
		
		if (slider.x < 0)
			slider.x = 0;
		
		value = min + Math.floor((max - min) * (slider.x / (slideTrack.width - slider.width)));
		valText.text = Std.string(value);
		valText.setTextFormat(tf);
	}
	
	private function OnMouseUp(e:MouseEvent)
	{
		if (hasEventListener(MouseEvent.MOUSE_MOVE) == true)
			removeEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
	}
	
	private function OnRemoved(e:Event)
	{
		removeEventListener(Event.REMOVED_FROM_STAGE, OnRemoved);
		if (stage.hasEventListener(MouseEvent.MOUSE_UP) == true)
			stage.removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
	}
}