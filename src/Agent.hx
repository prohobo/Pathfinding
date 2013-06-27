package ;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.events.Event;
import nme.geom.Point;
import nme.Lib;

/**
 * ...
 * @author Alex Klos
 */
class Agent extends Sprite
{
	// checkpoint index
	public var cpi:Int = 0;
	
	private var pathfinder:Algorithm;
	private var path:Array<Point>;
	
	public function new(_x:Float, _y:Float) 
	{
		super();
		x = _x;
		y = _y;
		
		switch (GV.alg)
		{
			case 0:
				pathfinder = new AStar();
			case 1:
				pathfinder = new BasicTheta();
		}
		
		var i:Bitmap = new Bitmap(new BitmapData(16, 16, true, 0xFF00FFFF));
		addChild(i);
		
		addEventListener(Event.ADDED_TO_STAGE, OnAdded);
	}
	
	private function OnAdded(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, OnAdded);
		
		// calculate first path
		GetPath();
		
		addEventListener(Event.ENTER_FRAME, Update);
	}
	
	private function Update(e:Event)
	{
		if (path.length > 0)
		{
			var angle:Float = Math.atan2(path[0].y - this.y, path[0].x - this.x);
			var distance:Float;
			
			x += Math.cos(angle);
			y += Math.sin(angle);
			
			for (a in GV.agents)
			{
				if (a != this)
				{
					distance = Math.sqrt(Math.pow(a.x - this.x, 2) + Math.pow(a.y - this.y, 2));
					if (distance < 16)
					{
						angle = Math.atan2(a.y - this.y, a.x - this.x);
						if (a.cpi > this.cpi)
						{
							x -= Math.cos(angle) * 2;
							y -= Math.sin(angle) * 2;
						}
						else
						{
							x -= Math.cos(angle);
							y -= Math.sin(angle);
						}
						break;
					}
				}
			}
			
			distance = Math.sqrt(Math.pow(path[0].x - this.x, 2) + Math.pow(path[0].y - this.y, 2));
			
			if (distance < 16)
			{
				//x = path[0].x;
				//y = path[0].y;
				path.remove(path[0]);
			}
		}
		else if (cpi < GV.checkpoints.length - 1)
		{
			cpi++;
			GetPath();
		}
		else
		{
			this.parent.removeChild(this);
			GV.agents.remove(this);
			removeEventListener(Event.ENTER_FRAME, Update);
		}
	}
	
	private function GetPath()
	{
		path = [];
		
		// path sharing (remove this from normal A*)
		if (cpi >= 1)
		{
			if (GV.communityPaths[cpi] != null)
			{
				path = GV.communityPaths[cpi].copy();
			}
		}
		
		if (path.length == 0)
		{
			for (pt in GV.grid)
			{
				if (this.hitTestPoint(pt.x, pt.y) == true)
				{
					pathfinder.FindPath(pt, GV.checkpoints[cpi]);
					path = pathfinder.path;
					GV.communityPaths[cpi] = path.copy();
					break;
				}
			}
		}
	}
	
}