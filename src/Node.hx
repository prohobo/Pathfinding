package ;
import flash.display.Sprite;
import flash.Vector;

/**
 * ...
 * @author Alex Klos
 */
class Node
{
	// nodes are used for both rectangular grids & quad trees
	// max size of node is 60 x 60 pixels
	
	public var x:Int;
	public var y:Int;
	public var size:Int;
	public var parent:Node;
	public var neighbors:Array<Node>;
	
	// pathfinding variables
	public var vars:Dynamic<Dynamic>;
	
	public var debugGfx:Sprite;
	
	public function new(_x:Int, _y:Int, _size:Int, _parent:Node) 
	{
		x = _x;
		y = _y;
		size = _size;
		parent = _parent;
		vars = { };
		
		//if (GV.debugMode)
			//DebugDraw();
	}
	
	public function DebugDraw()
	{
		debugGfx = new Sprite();
		debugGfx.graphics.lineStyle(1, 0xffffff, 0.1);
		debugGfx.graphics.beginFill(0xffffff, 0);
		debugGfx.graphics.drawRect(x, y, size, size);
		debugGfx.graphics.endFill();
		
		if (GV.alternateDebugLayer)
		{
			GV.debugLayerAlt.addChild(debugGfx);
		}
		else
		{
			GV.debugLayer.addChild(debugGfx);
		}
		
	}
	
	public function GetNeighbors():Array<Node>
	{
		var neighborList:Array<Node> = [];
		
		for (n in GV.nodes)
		{
			if (n.x != x || n.y != y)
			{
				var distance = Math.sqrt(Math.pow(x - n.x, 2) + Math.pow(y - n.y, 2));
				if (distance <= Math.sqrt(Math.pow(60, 2) + Math.pow(60, 2)))
				{
					//n.caught = true;
					var temp = new Node(n.x, n.y, n.size, n.parent);
					neighborList.push(temp);
				}
			}
		}
		
		return neighborList;
	}
	
}