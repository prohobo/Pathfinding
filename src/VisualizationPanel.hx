package ;
import algos.AStar;
import com.eclecticdesignstudio.motion.Actuate;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.system.System;
import flash.Vector;
import haxe.Timer;

/**
 * ...
 * @author Alex Klos
 */
class VisualizationPanel extends Sprite
{
	private var timer:flash.utils.Timer;
	
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
		GV.walls = [];
		
		addEventListener(MouseEvent.CLICK, OnClick);
		
		timer = new flash.utils.Timer(3000, 999);
		timer.start();
		timer.addEventListener(TimerEvent.TIMER, OnTimerTick);
		OnTimerTick(null);
	}
	
	private function OnTimerTick(e:TimerEvent)
	{
		var nearest:Float = 9999;
		var targetNode:Node = null;
		
		targetNode = GV.nodes[Math.floor(Math.random() * GV.nodes.length)];
		
		/*for (n in GV.nodes)
		{
			var distance:Float = Math.sqrt(Math.pow(n.x - mouseX, 2) + Math.pow(n.y - mouseY, 2));
			if (distance < nearest && n.x < mouseX && n.y < mouseY)
			{
				nearest = distance;
				targetNode = n;
			}
		}*/
		
		if (targetNode != null)
		{
			goalNode = targetNode;
			Timer.measure(CalculatePaths);
			//CalculatePaths();
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
	
	public function Reset()
	{
		RemoveGrid();
		RemoveAgents();
		GV.alternateDebugLayer = false;
		removeEventListener(MouseEvent.CLICK, OnClick);
		timer.removeEventListener(TimerEvent.TIMER, OnTimerTick);
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
			addChild(new Wall(targetNode.x, targetNode.y));
			GV.nodes.remove(targetNode);
		}
	}
	
	private function CalculatePaths()
	{
		for (a in GV.agents)
		{
			a.CalculatePath(goalNode);
		}
	}
	
	private var dli:Int;
	
	private function KillOldDebugLayer()
	{
		if (GV.alternateDebugLayer && getChildIndex(GV.debugLayer) != -1)
		{
			dli = getChildIndex(GV.debugLayer);
			removeChild(GV.debugLayer);
			GV.debugLayer.alpha = 1;
		}
		else if (getChildIndex(GV.debugLayerAlt) != -1)
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
		goalNode.debugGfx.graphics.drawRect(goalNode.x, goalNode.y, GV.nodeSize, GV.nodeSize);
		goalNode.debugGfx.graphics.endFill();
		
		for (a in GV.agents)
		{
			var start:Node = GC.GetNearestNode(a);
			/*start.debugGfx.graphics.beginFill(0xffffff, 0.05);
			start.debugGfx.graphics.lineStyle(0, 0x00ff00, 0);
			start.debugGfx.graphics.drawRect(start.x, start.y, GV.nodeSize, GV.nodeSize);
			start.debugGfx.graphics.endFill();*/
			
			for (n in 0...a.path.length - 1)
			{
				start.debugGfx.graphics.beginFill(0x00ff00, 0.5);
				start.debugGfx.graphics.lineStyle(1, 0x00ff00, 0.5);
				start.debugGfx.graphics.moveTo(a.path[n].x + (GV.nodeSize / 2), a.path[n].y + (GV.nodeSize / 2));
				start.debugGfx.graphics.lineTo(a.path[n + 1].x + (GV.nodeSize / 2), a.path[n + 1].y + (GV.nodeSize / 2));
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
		var columns = Std.int(width / GV.nodeSize);
		var rows = Std.int(height / GV.nodeSize);
		GV.nodes = [];
		
		for (i in 0...columns)
		{
			for (j in 0...rows)
			{
				var n = new Node(i * GV.nodeSize, j * GV.nodeSize, GV.nodeSize, null);
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
		
		for (w in GV.walls)
		{
			removeChild(w);
		}
		
		GV.walls = [];
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