package ;
import nme.display.Sprite;
import nme.geom.Point;

/**
 * ...
 * @author Alex Klos
 */
class Algorithm extends Sprite
{
	private var startNode:Node;
	private var goalNode:Node;
	public var path:Array<Point>;
	
	public function new() 
	{
		super();
		path = [];
	}
	
	public function FindPath(_startNode:Point, _goalNode:Point)
	{
		startNode = new Node(_startNode.x, _startNode.y);
		goalNode = new Node(_goalNode.x, _goalNode.y);
	}
}