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
		
		var test:Node = GC.GetNearestNode(this);
		if (GV.debugMode)
		{
			test.debugGfx.graphics.beginFill(0xffffff, 0.2);
			test.debugGfx.graphics.drawRect(test.x, test.y, 60, 60);
			test.debugGfx.graphics.endFill();
		}
		
		switch (GV.algorithm)
		{
			case 0:
				a = new AStar(test, _goal);
		}
		
		path = a.GetPath();
		
		if (GV.debugMode)
		{
			for (n in 0...path.length - 1)
			{
				test.debugGfx.graphics.beginFill(0x00ff00, 0.5);
				test.debugGfx.graphics.lineStyle(1, 0x00ff00, 0.5);
				test.debugGfx.graphics.moveTo(path[n].x + 30, path[n].y + 30);
				test.debugGfx.graphics.lineTo(path[n + 1].x + 30, path[n + 1].y + 30);
				test.debugGfx.graphics.endFill();
			}
		}
		
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