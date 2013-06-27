package ;
import nme.geom.Point;
import nme.Lib;

/**
 * ...
 * @author Alex Klos
 */
class AStar_fixed extends Algorithm
{
	private var openList:Array<Point>;
	private var closedList:Array<Point>;
	
	public function new() 
	{
		super();
	}
	
	override public function FindPath(_startNode:Point, _goalNode:Point)
	{
		super.FindPath(_startNode, _goalNode);
		
		startNode.vars.g = 0;
		startNode.vars.h = Math.sqrt(Math.pow(goalNode.x - startNode.x, 2) + Math.pow(goalNode.y - startNode.y, 2));
		startNode.vars.parent = startNode;
		
		openList = [];
		openList.insert(startNode.vars.g + startNode.vars.h, startNode);
		
		closedList = [];
		
		while (openList.length != 0)
		{
			var s:Node = openList.pop();
			
			if (s.x == goalNode.x && s.y == goalNode.y) break;
			
			closedList.push(s);
			
			//UpdateBounds(s);
			
			s.GetSuccessors();
			
			for (si in s.succ)
			{
				if (Lambda.has(closestList, si) == false)
				{
					if (Lambda.has(openList, si) == false)
					{
						si.vars.g = 9999;
						si.vars.parent = null;
					}
					
					UpdateNode(s, si);
				}
			}
		}
	}
	
	private function UpdateNode(_s:Node, _si:Node)
	{
		Lib.trace("Unhandled");
	}
	
}