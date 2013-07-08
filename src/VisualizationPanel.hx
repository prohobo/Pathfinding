package ;
import algos.AStar;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;
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
		
		addEventListener(MouseEvent.CLICK, OnClick);
	}
	
	public function Reset()
	{
		RemoveGrid();
		RemoveAgents();
		
		removeEventListener(MouseEvent.CLICK, OnClick);
	}
	
	private function OnClick(e:MouseEvent)
	{
		var nearest:Float = 9999;
		var targetNode:Node = null;
		
		for (n in GV.nodes)
		{
			var distance:Float = Math.sqrt(Math.pow(n.x - mouseX, 2) + Math.pow(n.y - mouseY, 2));
			if (distance < nearest && n.x < mouseX && n.y < mouseY)
			{
				nearest = distance;
				targetNode = n;
			}
		}
		
		if (GV.debugMode)
		{
			targetNode.debugGfx.graphics.beginFill(0xff0000, 0.2);
			targetNode.debugGfx.graphics.drawRect(targetNode.x, targetNode.y, 60, 60);
			targetNode.debugGfx.graphics.endFill();
		}
		
		if (targetNode != null)
		{
			for (a in GV.agents)
			{
				a.CalculatePath(targetNode);
			}
		}
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
				if (GV.debugMode)
					n.DebugDraw();
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