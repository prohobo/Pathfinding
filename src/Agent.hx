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
		
		switch (GV.algorithm)
		{
			case 0:
				a = new AStar(GC.GetNearestNode(this), _goal);
			case 1:
				a = new ThetaStar(GC.GetNearestNode(this), _goal);
			case 2:
				a = new JPSearch(GC.GetNearestNode(this), _goal);
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
			
			if (x < 0)
				x = 0;
			else if (x > 600)
				x = 600;
			
			if (y < 0)
				y = 0;
			else if (y > 420)
				y = 420;
			
			if (Math.sqrt(Math.pow(path[0].x + (GV.nodeSize / 2) - x, 2) + Math.pow(path[0].y + (GV.nodeSize / 2) - y, 2)) <= (GV.nodeSize / 2))
			{
				path.remove(path[0]);
			}
		}
	}
	
}