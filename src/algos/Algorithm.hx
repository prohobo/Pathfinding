package algos;
import flash.geom.Point;
import flash.Vector;

/**
 * ...
 * @author Alex Klos
 */
class Algorithm
{
	private var path:Array<Node>;
	
	private var open:Array<Node>;
	private var closed:Array<Node>;
	
	private var startNode:Node;
	private var goalNode:Node;
	
	private var cost:Float;
	
	public function new(_s:Node, _g:Node) 
	{
		// TODO: fix bug, if an agent is off of the grid the startnode returns null (crashes app)
		startNode = new Node(_s.x, _s.y, _s.size, _s.parent);
		goalNode = new Node(_g.x, _g.y, _g.size, _g.parent);
		
		// override
	}
	
	private function UpdateVertex(_s:Node, _neighbor:Node)
	{
		// override
	}
	
	/*public function InsertSorted(_n:Node, _list:Array<Node>)
	{
		var x;
		if (_list.length > 0)
		{
			x = Math.floor((_n.vars.f / _list[_list.length - 1].vars.f) * (_list.length));
			var i = 1;
			if (x - i > -1)
			{
				while (_list[x - i] != null && _list[x - i].vars.f > _n.vars.f)
				{
					trace(_list[x - i]);
					x = Math.floor((_n.vars.f / _list[x - 1].vars.f) * (x - 1));
					i++;
					if (x - i < 0) break;
				}
			}
		}
		else
		{
			x = 0;
		}
		
		_list.insert(x, _n);
	}*/
	
	public function GetPath():Array<Node>
	{
		//trace("PATH LENGTH: " + path.length);
		if (path.length > GV.longestPath)
			GV.longestPath = path.length;
		return path;
	}
	
}