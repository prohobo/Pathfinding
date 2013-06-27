package ;
import nme.geom.Point;
import nme.Lib;

/**
 * ...
 * @author Alex Klos
 */
class AStar extends Algorithm
{
	private var openList:Array<Node>;
	private var closedList:Array<Node>;
	
	public function new() 
	{
		super();
	}
	
	override public function FindPath(_startNode:Point, _goalNode:Point)
	{
		super.FindPath(_startNode, _goalNode);
		
		openList = [];
		closedList = [];
		
		CalcAttributes(startNode);
		
		openList.push(startNode);
		
		while (openList.length > 0)
		{
			var node:Node = null;
			for (n in openList)
			{
				// get node with lowest f score
				if (node == null || n.vars[2] < node.vars[2])
				{
					node = n;
				}
			}
			
			if (node != null)
			{
				openList.remove(node);
				closedList.push(node);
				
				if (node.x == goalNode.x && node.y == goalNode.y) break;
				
				GetNeighbors(node);
			}
			else
			{
				Lib.trace("No node found in openList!");
			}
		}
		
		for (pn in closedList)
		{
			path.push(new Point(pn.x, pn.y));
		}
	}
	
	private function CalcAttributes(_n:Node)
	{
		// g score (steps from start node)
		_n.vars[0] = closedList.length;
		
		// h score (euclidean distance to goal node)
		_n.vars[1] = Math.sqrt(Math.pow(goalNode.x - _n.x, 2) + Math.pow(goalNode.y - _n.y, 2));
		
		// f score (g + h)
		_n.vars[2] = _n.vars[0] + _n.vars[1];
	}
	
	private function GetNeighbors(_n:Node)
	{
		for (pt in GV.grid)
		{
			if (_n.x != pt.x || _n.y != pt.y)
			{
				var inClosedList:Bool = false;
				
				// check if the node at this point is already in closedList
				for (tempNode in closedList)
				{
					if (tempNode.x == pt.x && tempNode.y == pt.y)
					{
						inClosedList = true;
						break;
					}
				}
				
				if (inClosedList == false)
				{
					// test node's center for adjacency to _n
					var left:Bool = CheckLeft(pt, _n);
					var right:Bool = CheckRight(pt, _n);
					var above:Bool = CheckAbove(pt, _n);
					var below:Bool = CheckBelow(pt, _n);
					
					if (left || right || above || below)
					{
						// found a neighbor
						var neighbor:Node = new Node(pt.x, pt.y);
						CalcAttributes(neighbor);
						openList.push(neighbor);
					}
				}
			}
		}
	}
	
}