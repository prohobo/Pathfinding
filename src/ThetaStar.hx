package ;
import nme.geom.Point;
import nme.Lib;

/**
 * ...
 * @author Alex Klos
 */
class ThetaStar extends Algorithm
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
		
		InitializeNode(startNode);
		InitializeNode(goalNode);
		
		startNode.vars[0] = 0;
		startNode.vars[1] = startNode;
		openList.push(startNode);
		//openList.insert(startNode.vars[0] + startNode.vars[5], startNode);
		
		ComputeShortestPath();
	}
	
	private function InitializeNode(_n:Node)
	{
		_n.vars[0] = 9999;	// g score
		_n.vars[1] = null;		// parent
		//_n.vars[2] = null;		// local
		//_n.vars[3] = -9999;	// lb
		//_n.vars[4] = 9999;	// ub
		
		// h score (approx. distance to goal node, by order of cost)
		_n.vars[5] = (Math.floor(Math.abs(goalNode.x - _n.x)) / 16) + (Math.floor(Math.abs(goalNode.y - _n.y)) / 16);
		
		// f score (g + h)
		_n.vars[6] = _n.vars[0] + _n.vars[5];
	}
	
	private function ComputeShortestPath()
	{
		while (true)
		{
			var smallestKeyNode:Node = null;
			for (n in openList)
			{
				if (smallestKeyNode == null || n.vars[6] < smallestKeyNode.vars[6])
				{
					smallestKeyNode = n;
				}
			}
			
			if (smallestKeyNode != null)
			{
				if (smallestKeyNode.x == goalNode.x && smallestKeyNode.y == goalNode.y) break;
				
				openList.remove(smallestKeyNode);
				closedList.push(smallestKeyNode);
				
				GetNeighbors(smallestKeyNode);
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
						// found neighbor
						var neighbor:Node = new Node(pt.x, pt.y);
						
						var inOpenList:Bool = false;
						
						// check if the node at this point is already in openList
						for (tempNode in openList)
						{
							if (tempNode.x == pt.x && tempNode.y == pt.y)
							{
								inOpenList = true;
								break;
							}
						}
						
						if (inOpenList == false)
						{
							// initialize node
							InitializeNode(neighbor);
						}
						
						// update node
						UpdateNode(_n, neighbor);
					}
				}
			}
		}
	}
	
	private function UpdateNode(_n:Node, _neighbor:Node)
	{
		var gOld:Float = _neighbor.vars[0];
		//_n.vars[0] = closedList.length;
		ComputeCost(_n, _neighbor);
		
		if (_neighbor.vars[0] < gOld)
		{
			var inOpenList:Bool = false;
			
			// check if the node is already in openList
			for (tempNode in openList)
			{
				if (tempNode.x == _neighbor.x && tempNode.y == _neighbor.y)
				{
					inOpenList = true;
					break;
				}
			}
			
			if (inOpenList == false)
			{
				//openList.remove(_n);
				openList.push(_neighbor);
			}
		}
	}
	
	private function ComputeCost(_n:Node, _neighbor:Node)
	{
		if (LineOfSight(_n, _neighbor) == true)
		{
			// get g value for parent of n
			// get h value for parent of n to neighbor
			// get g value for neighbor
			var g_n:Float = _n.vars[1].vars[0];
			var h_to_neighbor:Float = (Math.floor(Math.abs(_neighbor.x - _n.x)) / 16) + (Math.floor(Math.abs(_neighbor.y - _n.y)) / 16);
			var g_neighbor:Float = _neighbor.vars[0];
			
			if (g_n + h_to_neighbor < g_neighbor)
			{
				_neighbor.vars[1] = _n.vars[1];
				_neighbor.vars[0] = g_n + h_to_neighbor;
				//_neighbor.vars[2] = _n;
			}
		}
	}
	
	private function LineOfSight(_n:Node, _neighbor:Node):Bool
	{
		// see if a straight line from the node to the goalNode passes through an obstacle or not
		// just return true for now since walls aren't implemented yet
		return true;
	}
}