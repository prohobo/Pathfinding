package ;
import algos.Algorithm;
import algos.AStar;
import algos.JPSearch;
import algos.ThetaStar;
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
		path = [];
		
		var start:Node = GC.GetNearestNode(this);
		
		var distance = Math.sqrt(Math.pow(_goal.x - start.x, 2) + Math.pow(_goal.y - start.y, 2));
		if (distance > GV.longestDistance)
			GV.longestDistance = Std.int(distance);
		
		switch (GV.algorithm)
		{
			case 0:
				a = new AStar(start, _goal);
			case 1:
				a = new ThetaStar(start, _goal);
			case 2:
				a = new JPSearch(start, _goal);
		}
		
		path = a.GetPath();
		a = null;
		
		if (hasEventListener(Event.ENTER_FRAME) == false)
			addEventListener(Event.ENTER_FRAME, Update);
	}
	
	public function Update(e:Event)
	{
		if (path != null && path.length > 0)
		{
			var angle = Math.atan2(path[0].y + (GV.nodeSize / 2) - y, path[0].x + (GV.nodeSize / 2) - x);
			x += Math.cos(angle) * 3;
			y += Math.sin(angle) * 3;
			
			for (a in GV.agents)
			{
				if (a != this)
				{
					if (a.hitTestObject(this))
					{
						angle = Math.atan2(a.y - y, a.x - x);
						x -= Math.cos(angle) * 3;
						y -= Math.sin(angle) * 3;
					}
				}
			}
			
			for (w in GV.walls)
			{
				if (w.hitTestObject(this))
				{
					angle = Math.atan2(w.y + (GV.nodeSize / 2) - y, w.x + (GV.nodeSize / 2) - x);
					x -= Math.cos(angle) * 3;
					y -= Math.sin(angle) * 3;
				}
			}
			
			if (x < 6)
				x = 6;
			else if (x > 594)
				x = 594;
			
			if (y < 6)
				y = 6;
			else if (y > 414)
				y = 414;
			
			if (Math.sqrt(Math.pow(path[0].x + (GV.nodeSize / 2) - x, 2) + Math.pow(path[0].y + (GV.nodeSize / 2) - y, 2)) <= (GV.nodeSize / 2))
			{
				path.remove(path[0]);
			}
		}
	}
	
}