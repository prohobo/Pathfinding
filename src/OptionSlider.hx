package ;
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
		
		options.addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
	}
	
	private function OnMouseDown(e:MouseEvent)
	{
		if (options.hasEventListener(MouseEvent.MOUSE_MOVE) == false)
			options.addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
		
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
		if (options.hasEventListener(MouseEvent.MOUSE_MOVE) == true)
			options.removeEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
		
		if (Math.abs(options.x % containerBox.width) < containerBox.width / 2)
		{
			Actuate.tween(options, 0.5, { x: options.x - (options.x % containerBox.width) } );
		}
		else if (Math.abs(options.x % containerBox.width) >= containerBox.width / 2)
		{
			Actuate.tween(options, 0.5, { x: options.x + (-180 - (options.x % containerBox.width)) } );
		}
	}
	
	private function OnRemoved(e:Event)
	{
		removeEventListener(Event.REMOVED_FROM_STAGE, OnRemoved);
		if (stage.hasEventListener(MouseEvent.MOUSE_UP) == true)
			stage.removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
	}
	
}