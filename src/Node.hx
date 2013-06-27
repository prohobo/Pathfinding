package ;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.geom.Point;

/**
 * ...
 * @author Alex Klos
 */
class Node
{
	// For A*:
	// 0 -> g, 1 -> h, 2 -> parent
	
	// Basic Theta*:
	// 0 -> g, 1 -> h, 2 -> f, 3 -> parent
	
	public var vars:Dynamic<Dynamic>;
	public var x:Float;
	public var y:Float;
	public var succ:Array<Point>;

	public function new(_x:Float, _y:Float) 
	{
		x = _x;
		y = _y;
		vars = cast( { } );
		
		//Initialize();
	}
	
	private function Initialize()
	{
		// A*
		this.vars.g = 0;
		this.vars.h = 0;
		this.vars.parent = null;
	}
	
	public function GetSuccessors()
	{
		for (pt in GV.grid)
		{
			if (CheckLeft(pt))
				succ.push(pt);
			if (CheckRight(pt))
				succ.push(pt);
			if (CheckAbove(pt))
				succ.push(pt);
			if (CheckBelow(pt))
				succ.push(pt);
		}
	}
	
	private function CheckLeft(_pt:Point):Bool
	{
		if (_pt.x < this.x && _pt.x == this.x - 16 && _pt.y == this.y) return true;
		return false;
	}
	
	private function CheckRight(_pt:Point):Bool
	{
		if (_pt.x > this.x && _pt.x == this.x + 16 && _pt.y == this.y) return true;
		return false;
	}
	
	private function CheckAbove(_pt:Point):Bool
	{
		if (_pt.y < this.y && _pt.y == this.y - 16 && _pt.x == this.x) return true;
		return false;
	}
	
	private function CheckBelow(_pt:Point):Bool
	{
		if (_pt.y > this.y && _pt.y == this.y + 16 && _pt.x == this.x) return true;
		return false;
	}
}