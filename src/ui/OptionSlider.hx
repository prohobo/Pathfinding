package ui;
import com.eclecticdesignstudio.motion.Actuate;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

/**
 * ...
 * @author Alex Klos
 */
class OptionSlider extends Sprite
{
	public var containerBox:Sprite;
	public var options:Sprite;
	
	public var selectedOption:Int;
	
	private var nextBtn:Sprite;
	private var prevBtn:Sprite;
	
	private var minX:Float;
	private var maxX:Float = 0;
	
	private var mouseXDistance:Float;
	
	public function new() 
	{
		super();
		
		containerBox = new Sprite();
		
		options = new Sprite();
		
		addEventListener(Event.ADDED_TO_STAGE, OnAdded);
		addEventListener(Event.REMOVED_FROM_STAGE, OnRemoved);
	}
	
	private function OnAdded(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, OnAdded);
		
		addChild(containerBox);
		
		options.mask = containerBox;
		options.buttonMode = true;	
		addChild(options);
		
		minX = -(options.width - containerBox.width);
		
		addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
		addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
	}
	
	private function OnMouseDown(e:MouseEvent)
	{
		if (hasEventListener(MouseEvent.MOUSE_MOVE) == false)
			addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
		
		addEventListener(MouseEvent.MOUSE_OUT, OnMouseUp);
		
		mouseXDistance = mouseX - options.x;
	}
	
	private function OnMouseMove(e:MouseEvent)
	{
		options.x = mouseX - mouseXDistance;
		if (options.x > maxX)
			options.x = maxX;
		
		if (options.x < minX)
			options.x = minX;
		
	}
	
	private function OnMouseUp(e:MouseEvent)
	{
		removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
		removeEventListener(MouseEvent.MOUSE_OUT, OnMouseUp);
		
		if (hasEventListener(MouseEvent.MOUSE_MOVE) == true)
			removeEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
		
		if (Math.abs(options.x % containerBox.width) < containerBox.width / 2)
		{
			Actuate.tween(options, 0.5, { x: options.x - (options.x % containerBox.width) } ).onComplete(SetSelection);
		}
		else if (Math.abs(options.x % containerBox.width) >= containerBox.width / 2)
		{
			Actuate.tween(options, 0.5, { x: options.x + ( -180 - (options.x % containerBox.width)) } ).onComplete(SetSelection);
		}
	}
	
	private function SetSelection()
	{
		selectedOption = Std.int(Math.abs(options.x / containerBox.width));
		
		addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
	}
	
	private function OnRemoved(e:Event)
	{
		removeEventListener(Event.REMOVED_FROM_STAGE, OnRemoved);
		if (hasEventListener(MouseEvent.MOUSE_UP) == true)
			removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
	}
	
}