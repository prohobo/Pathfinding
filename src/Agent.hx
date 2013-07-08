package ;
import algos.Algorithm;
import algos.AStar;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.filters.GlowFilter;
import flash.geom.Point;

/**
 * ...
 * @author Alex Klos
 */
class Agent extends Sprite
{
	private var body:Sprite;
	public var path:Array<Node>;
	
	public function new(_x:Float, _y:Float) 
	{
		super();
		x = _x;
		y = _y;
		
		body = new Sprite();
		body.graphics.beginFill(Std.int(Math.random() * 0xffffff), 0.2);
		body.graphics.drawCircle(0, 0, 6);
		body.graphics.endFill();
		body.graphics.lineStyle(1, 0xffffff, 0.5);
		body.graphics.beginFill(0x000000, 0);
		body.graphics.drawCircle(0, 0, 6);
		body.graphics.endFill();
		addChild(body);
		
		//addEventListener(Event.ENTER_FRAME, Update);
	}
	
	public function CalculatePath(_goal:Node)
	{
		var a:Algorithm = null;
		
		switch (GV.algorithm)
		{
			case 0:
				a = new AStar(GC.GetNearestNode(this), _goal);
		}
		
		path = a.GetPath();
		
		addEventListener(Event.ENTER_FRAME, Update);
	}
	
	public function Update(e:Event)
	{
		if (path != null && path.length > 0)
		{
			var angle = Math.atan2(path[0].y + 30 - y, path[0].x + 30 - x);
			x += Math.cos(angle) * 3;
			y += Math.sin(angle) * 3;
			
			if (Math.sqrt(Math.pow(path[0].x + 30 - x, 2) + Math.pow(path[0].y + 30 - y, 2)) <= 30)
			{
				path.remove(path[0]);
			}
		}
	}
	
}