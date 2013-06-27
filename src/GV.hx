package ;
import nme.geom.Point;

/**
 * ...
 * @author Alex Klos
 */
class GV
{
	public static var environments:Array<Environment>;
	public static var agents:Array<Agent>;
	public static var grid:Array<Point>;
	public static var checkpoints:Array<Point>;
	public static var communityPaths:Array<Array<Point>>;
	
	public static var env:Int;
	public static var alg:Int;
	public static var agt:Int;
	
	public static var currentEnv:Environment;
}