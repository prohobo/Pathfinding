package ;
import flash.display.Sprite;
import flash.Vector;

/**
 * ...
 * @author Alex Klos
 */
class GV
{
	public static var algorithm:Int;
	public static var searchSpace:Int;
	public static var agentCount:Int;
	public static var tweak:Int;
	public static var nodeSize:Int;
	
	public static var visPanelRef:VisualizationPanel;
	
	public static var nodes:Array<Node>;
	public static var agents:Array<Agent>;
	public static var walls:Array<Wall>;
	
	public static var debugMode:Bool = true;
	public static var debugLayer:Sprite;
	public static var debugLayerAlt:Sprite;
	public static var alternateDebugLayer:Bool = false;
}