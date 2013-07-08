package ;
import algos.AStar;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.Vector;

/**
 * ...
 * @author Alex Klos
 */
class VisualizationPanel extends Sprite
{

	public function new() 
	{
		super();
		
		GV.visPanelRef = this;
		
		x = 200;
		
		var panel = new Bitmap(new BitmapData(600, 420, true, 0xff121212));
		addChild(panel);
	}
	
	public function Begin()
	{
		GenerateGrid();
		AddAgents();
	}
	
	public function Reset()
	{
		RemoveGrid();
		RemoveAgents();
	}
	
	private function GenerateGrid()
	{
		var columns = Std.int(width / 60);
		var rows = Std.int(height / 60);
		GV.nodes = [];
		
		for (i in 0...columns)
		{
			for (j in 0...rows)
			{
				var n = new Node(i * 60, j * 60, 60, null);
				GV.nodes.push(n);
			}
		}
	}
	
	private function RemoveGrid()
	{
		if (GV.debugMode)
		{
			for (n in GV.nodes)
			{
				removeChild(n.debugGfx);
			}
		}
		
		GV.nodes = [];
	}
	
	private function AddAgents()
	{
		GV.agents = [];
		
		for (i in 0...GV.agentCount)
		{
			var a:Agent = new Agent(6 + Math.random() * (600 - 6), 6 + Math.random() * (420 - 6));
			GV.agents.push(a);
			addChild(a);
		}
	}
	
	private function RemoveAgents()
	{
		for (a in GV.agents)
		{
			removeChild(a);
		}
		
		GV.agents = [];
	}
}