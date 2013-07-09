package algos;

/**
 * ...
 * @author Alex Klos
 */
class JPSearch extends AStar
{

	public function new(_s:Node, _g:Node) 
	{
		super(_s, _g);
	}
	
	override private function GetNeighbors(_s:Node)
	{
		super.GetNeighbors(_s);
		_s.neighbors = IdentifySuccessors(_s, startNode, goalNode);
	}
	
	private function IdentifySuccessors(current:Node, start:Node, end:Node):Array<Node>
	{
		var successors:Array<Node> = [];
		var neighbours:Array<Node> = current.neighbors;
		
		for (neighbour in neighbours)
		{
			// Direction from current node to neighbor:
			var dX:Float = neighbour.x - current.x;
			var dY:Float = neighbour.y - current.y;
			// Try to find a node to jump to:
			var jumpPoint:Node = Jump(current.x, current.y, dX, dY, start, end);
			// If found add it to the list:
			if (jumpPoint != null) successors.push(jumpPoint);
		}
		
		return successors;
	}
	
	private function clamp(val:Float, min:Float, max:Float):Float
	{
		return Math.max(min, Math.min(max, val));
	}
	
	private function Jump(cX:Float, cY:Float, dX:Float, dY:Float, start:Node, end:Node):Node
	{
		// cX, cY - Current Node Position,  dX, dY - Direction
	 
		// Position of new node we are going to consider:
		var nextX:Float = cX + dX;
		var nextY:Float = cY + dY;
		
		// If it's blocked we can't jump here
		//if (_world.isBlocked(nextX, nextY)) return null;
		for (w in GV.walls)
		{
			if (w.x == nextX && w.y == nextY)
				return null;
		}
		
		var nextNode:Node = null;
		for (n in GV.nodes)
		{
			if (n.x == nextX && n.y == nextY)
			{
				nextNode = n;
				break;
			}
		}
	 
		// If the node is the goal return it
		if (nextNode.x == end.x && nextNode.y == end.y) return nextNode;
	 
		// Diagonal Case   
		if (dX != 0 && dY != 0)
		{
			if (true) 
			{
				return nextNode;
			}
			
			// Check in horizontal and vertical directions for forced neighbors
			// This is a special case for diagonal direction
			if (Jump(nextX, nextY, dX, 0, start, end) != null || Jump(nextX, nextY, 0, dY, start, end) != null)
			{
				return nextNode;
			}
		} 
		else
		{
			// Horizontal case
			if (dX != 0)
			{
				if (true)
				{
					return nextNode;
				}
			/// Vertical case
			}
			else
			{
				if (true)
				{
					return nextNode;
				}
			}
		}
		
		/// If forced neighbor was not found try next jump point
		return Jump(nextX, nextY, dX, dY, start, end);
	}
	
}