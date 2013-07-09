package algos;
import flash.geom.Point;

/**
 * ...
 * @author Alex Klos
 */
class ThetaStar extends AStar
{

	public function new(_s:Node, _g:Node) 
	{
		super(_s, _g);
	}
	
	override private function UpdateVertex(_s:Node, _neighbor:Node)
	{
		if (LineOfSight(_s.parent, _neighbor))
		{
			// Theta*
			if (_s.parent.vars.g + cost < _neighbor.vars.g)
			{
				_neighbor.vars.g = _s.parent.vars.g + cost;
				_neighbor.parent = _s.parent;
				
				if (GC.InList(_neighbor, open) == true)
				{
					open.remove(_neighbor);
				}
				
				_neighbor.vars.h = Math.sqrt(Math.pow(goalNode.x - _neighbor.x, 2) + Math.pow(goalNode.y - _neighbor.y, 2));
				_neighbor.vars.f = _neighbor.vars.g + _neighbor.vars.h;
				open.push(_neighbor);
			}
		}
		else
		{
			// A*
			super.UpdateVertex(_s, _neighbor);
		}
	}
	
	private function LineOfSight(_parent:Node, _neighbor:Node):Bool
	{
		var angle = Math.atan2(_neighbor.y - _parent.y, _neighbor.x - _parent.x);
		var testPoint:Point = new Point(_parent.x + (GV.nodeSize / 2), _parent.y + (GV.nodeSize / 2));
		var distance = Math.sqrt(Math.pow(_neighbor.x - _parent.x, 2) + Math.pow(_neighbor.y - _parent.y, 2));
		cost = distance;
		
		if (GV.walls.length == 0)
			return true;
		
		while (distance > 30)
		{
			testPoint.x += Math.cos(angle) * GV.nodeSize;
			testPoint.y += Math.sin(angle) * GV.nodeSize;
			distance = Math.sqrt(Math.pow(_neighbor.x + (GV.nodeSize / 2) - testPoint.x, 2) + Math.pow(_neighbor.y + (GV.nodeSize / 2) - testPoint.y, 2));
			
			// check for wall collisions
			for (w in GV.walls)
			{
				if (w.hitTestPoint(testPoint.x, testPoint.y))
				{
					return false;
				}
			}
		}
		
		return true;
	}
}