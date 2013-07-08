package algos;
import flash.geom.Point;
import flash.Vector;

/**
 * ...
 * @author Alex Klos
 */
class AStar extends Algorithm
{
	// node vars setup:
	//	[g, h, f, parent]
	public function new(_s:Node, _g:Node) 
	{
		super(_s, _g);
		
		startNode.vars.g = 0;
		startNode.vars.h = Math.sqrt(Math.pow(goalNode.x - startNode.x, 2) + Math.pow(goalNode.y - startNode.y, 2));
		startNode.vars.f = Math.floor(startNode.vars.g + startNode.vars.h);
		open = [];
		open.push(startNode);
		closed = [];
		
		while (open.length > 0)
		{
			GC.QuickSort(open, 0, open.length - 1);
			
			var s:Node = open[0];
			open.splice(0, 1);
			
			if (s.x == goalNode.x && s.y == goalNode.y)
			{
				closed.push(s);
				break;
			}
			
			closed.push(s);
			
			s.neighbors = s.GetNeighbors();
			
			for (neighbor in s.neighbors)
			{				
				if (GC.InList(neighbor, closed) == false)
				{
					
					if (GC.InList(neighbor, open) == false)
					{
						neighbor.vars.g = 9999;
					}
					
					UpdateVertex(s, neighbor);
				}
			}
		}
		
		path = closed;
	}
	
	override private function UpdateVertex(_s:Node, _neighbor:Node)
	{
		if (_s.vars.g + 1 < _neighbor.vars.g)
		{
			_neighbor.vars.g = _s.vars.g + 1;
			
			if (GC.InList(_neighbor, open) == true)
			{
				open.remove(_neighbor);
			}
			
			_neighbor.vars.h = Math.sqrt(Math.pow(goalNode.x - _neighbor.x, 2) + Math.pow(goalNode.y - _neighbor.y, 2));
			_neighbor.vars.f = Math.floor(_neighbor.vars.g + _neighbor.vars.h);
			open.push(_neighbor);
		}
	}
	
}