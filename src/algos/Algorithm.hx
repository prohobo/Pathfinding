package algos;
import flash.Vector;

/**
 * ...
 * @author Alex Klos
 */
class Algorithm
{
	public var path:Array<Node>;
	
	private var open:Array<Node>;
	private var closed:Array<Node>;
	
	private var startNode:Node;
	private var goalNode:Node;
	
	public function new(_s:Node, _g:Node) 
	{
		startNode = new Node(_s.x, _s.y, _s.size, _s.parent);
		goalNode = new Node(_g.x, _g.y, _g.size, _g.parent);
		
		// override
	}
	
	private function UpdateVertex(_s:Node, _neighbor:Node)
	{
		// override
	}
	
}