package algos;
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
		startNode.vars.h = 0;
		startNode.vars.parent = startNode;
		open = [];
		open.insert(startNode.vars.g + startNode.vars.h, startNode);
		closed = [];
		
		while (open.length > 0)
		{
			var s:Node = open.pop();
			
			if (s.x == goalNode.x && s.y == goalNode.y)
			{
				closed.push(s);
				break;
			}
			
			closed.push(s);
			
			s.neighbors = s.GetNeighbors();
			
			for (neighbor in s.neighbors)
			{
				if (GC.GetIndex(neighbor, closed) == -1)
				{
					if (GC.GetIndex(neighbor, open) == -1)
					{
						neighbor.vars.g = 9999;
						neighbor.vars.parent = null;
					}
					
					UpdateVertex(s, neighbor);
				}
			}
		}
	}
	
	override private function UpdateVertex(_s:Node, _neighbor:Node)
	{
		if (_s.vars.g + 1 < _neighbor.vars.g)
		{
			_neighbor.vars.g = _s.vars.g + 1;
			_neighbor.vars.parent = _s;
			
			if (GC.GetIndex(_neighbor, open) != -1)
			{
				open.remove(_neighbor);
			}
			
			open.insert(_neighbor.vars.g + _neighbor.vars.h, _neighbor);
		}
	}
	
}