package ;

/**
 * ...
 * @author Alex Klos
 */

class GC
{
	public static function InList(_o:Node, _list:Array<Node>):Bool
	{
		for (i in 0..._list.length)
		{
			//trace(_o + " " + _list[i]);
			if (_o.x == _list[i].x && _o.y == _list[i].y)
			{
				return true;
			}
		}
		
		return false;
	}
	
	public static function GetNearestNode(_a:Agent):Node
	{
		var nearest:Float = 9999;
		var targetNode:Node = null;
		
		for (n in GV.nodes)
		{
			var distance:Float = Math.sqrt(Math.pow(n.x - _a.x, 2) + Math.pow(n.y - _a.y, 2));
			if (distance < nearest && n.x < _a.x && n.y < _a.y)
			{
				nearest = distance;
				targetNode = n;
			}
		}
		
		return targetNode;
	}
	
	public static function QuickSort(a:Array<Node>, lo:Int, hi:Int)
	{
		var i:Int = lo;
		
		for (j in lo...hi)
		{
			if (a[j].vars.f <= a[hi].vars.f)
			{
				Swap(a, i, j);
				i++;
			}
		}
		
		Swap(a, i, hi);
		
		if (lo < i - 1) QuickSort(a, lo, i - 1);
		if (i + 1 < hi) QuickSort(a, i + 1, hi);
	}

	public static function Swap(a:Array<Node>, i:Int, j:Int)
	{
		var temp:Node;
		temp = a[i];
		a[i] = a[j];
		a[j] = temp;
	}
}