package ;
import algos.AStar;
import com.eclecticdesignstudio.motion.Actuate;
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
		GV.debugLayer = new Sprite();
		GenerateGrid();
		addChild(GV.debugLayer);
		AddAgents();
		
		addEventListener(MouseEvent.CLICK, OnClick);
	}
	
	public function Reset()
	{
		RemoveGrid();
		RemoveAgents();
		GV.alternateDebugLayer = false;
		removeEventListener(MouseEvent.CLICK, OnClick);
	}
	
	private var goalNode:Node;
	
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
		
		if (targetNode != null)
		{
			for (a in GV.agents)
			{
				a.CalculatePath(targetNode);
			}
		}
		
		if (GV.debugMode)
		{
			if (GV.alternateDebugLayer)
			{
				goalNode = targetNode;
				GV.alternateDebugLayer = !GV.alternateDebugLayer;
				RefreshDebugDraw();
				Actuate.tween(GV.debugLayerAlt, 0.3, { alpha: 0 } ).onComplete(KillOldDebugLayer);
			}
			else
			{
				goalNode = targetNode;
				GV.alternateDebugLayer = !GV.alternateDebugLayer;
				RefreshDebugDraw();
				Actuate.tween(GV.debugLayer, 0.3, { alpha: 0 } ).onComplete(KillOldDebugLayer);
			}
			
		}
	}
	
	private var dli:Int;
	
	private function KillOldDebugLayer()
	{
		if (GV.alternateDebugLayer)
		{
			dli = getChildIndex(GV.debugLayer);
			removeChild(GV.debugLayer);
			GV.debugLayer.alpha = 1;
		}
		else
		{
			dli = getChildIndex(GV.debugLayerAlt);
			removeChild(GV.debugLayerAlt);
			GV.debugLayerAlt.alpha = 1;
		}
	}
	
	private function RefreshDebugDraw()
	{
		if (GV.alternateDebugLayer)
		{
			GV.debugLayerAlt = new Sprite();
		}
		else
		{
			GV.debugLayer = new Sprite();
		}
		
		for (n in GV.nodes)
		{
			n.DebugDraw();
		}
		
		goalNode.debugGfx.graphics.beginFill(0xff0000, 0.2);
		goalNode.debugGfx.graphics.drawRect(goalNode.x, goalNode.y, 60, 60);
		goalNode.debugGfx.graphics.endFill();
		
		for (a in GV.agents)
		{
			var start:Node = GC.GetNearestNode(a);
			/*start.debugGfx.graphics.beginFill(0xffffff, 0.05);
			start.debugGfx.graphics.lineStyle(0, 0x00ff00, 0);
			start.debugGfx.graphics.drawRect(start.x, start.y, 60, 60);
			start.debugGfx.graphics.endFill();*/
			
			for (n in 0...a.path.length - 1)
			{
				start.debugGfx.graphics.beginFill(0x00ff00, 0.5);
				start.debugGfx.graphics.lineStyle(1, 0x00ff00, 0.5);
				start.debugGfx.graphics.moveTo(a.path[n].x + 30, a.path[n].y + 30);
				start.debugGfx.graphics.lineTo(a.path[n + 1].x + 30, a.path[n + 1].y + 30);
				start.debugGfx.graphics.endFill();
			}
		}
		
		if (GV.alternateDebugLayer)
		{
			if (dli + 1 > numChildren)
			{
				addChildAt(GV.debugLayerAlt, dli);
			}
			else
			{
				addChildAt(GV.debugLayerAlt, dli + 1);
			}
			
		}
		else
		{
			addChildAt(GV.debugLayer, dli);
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
				if (GV.alternateDebugLayer)
				{
					GV.debugLayerAlt.removeChild(n.debugGfx);
				}
				else
				{
					GV.debugLayer.removeChild(n.debugGfx);
				}
			}
		}
		
		if (GV.alternateDebugLayer)
		{
			removeChild(GV.debugLayerAlt);
		}
		else
		{
			removeChild(GV.debugLayer);
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