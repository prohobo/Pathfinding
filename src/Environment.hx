package ;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.geom.Point;
import nme.text.TextField;
import nme.text.TextFormat;

/**
 * 480x480px
 * @author Alex Klos
 */
class Environment extends Sprite
{

	public function new() 
	{
		super();
		AddGrid();
		AddCheckpoints();
		AddAgents();
	}
	
	private function AddGrid()
	{
		GV.grid = [];
		
		// 16 x 16 nodes
		// 480 x 480 grid
		// 30 x 30 tiles
		for (i in 0...30)
		{
			for (j in 0...30)
			{
				var point:Point = new Point(320 + (16 * i), 16 * j);
				GV.grid.push(point);
				//addChild(point);
			}
		}
	}
	
	private function AddCheckpoints()
	{
		GV.checkpoints = [];
		
		var tf:TextFormat = new TextFormat();
		tf.size = 16;
		
		for (i in 0...5)
		{
			var point:Point = new Point(320 + (Math.floor(Math.random() * 30) * 16), Math.floor(Math.random() * 30) * 16);
			var cpBmp:Bitmap = new Bitmap(new BitmapData(16, 16, true, 0xFFFF00FF));
			cpBmp.x = point.x + 8 - cpBmp.width / 2;
			cpBmp.y = point.y + 8 - cpBmp.height / 2;
			addChild(cpBmp);
			
			var cpText:TextField = new TextField();
			cpText.text = Std.string(i);
			cpText.setTextFormat(tf);
			cpText.width = cpText.textWidth + 5;
			cpText.x = cpBmp.x + cpBmp.width / 2 - 5;
			cpText.y = cpBmp.y + cpBmp.height / 2 - 12;
			addChild(cpText);
			
			GV.checkpoints.push(point);
		}
	}
	
	private function AddAgents()
	{
		GV.agents = [];
		
		for (i in 0...GV.agt)
		{
			var agent:Agent = new Agent(320 + (Math.floor(Math.random() * 30) * 16), Math.floor(Math.random() * 30) * 16);
			GV.agents.push(agent);
			addChild(agent);
		}
	}
	
}