package ;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.net.FileReference;
import flash.utils.ByteArray;
import flash.xml.XML;

/**
 * ...
 * @author Alex Klos
 */
class OutputPanel extends Sprite
{
	private var output:Xml;
	//private var delimiter:Xml;
	
	public function new() 
	{
		super();
		
		x = 200;
		y = 420;
		
		var panel:Bitmap = new Bitmap(new BitmapData(600, 60, true, 0xff212121));
		addChild(panel);
		
		GV.outputRef = this;
		
		// show options, show execution time + path length + wall count
	}
	
	public function BeginLog()
	{
		//delimiter = Xml.createComment("\r\n");
		output = Xml.createElement("output");
		var settings = Xml.createElement("settings");
		switch (GV.algorithm)
		{
			case 0:
				settings.set("algorithm", "A-Star");
			case 1:
				settings.set("algorithm", "Theta-Star");
			case 2:
				settings.set("algorithm", "Jump-Point-Search");
		}
		
		switch (GV.searchSpace)
		{
			case 0:
				settings.set("searchSpace", "60");
			case 1:
				settings.set("searchSpace", "30");
		}
		
		settings.set("agents", Std.string(GV.agentCount));
		output.addChild(settings);
	}
	
	public function AddEntry(_execTime:Int, _longestPath:Int, _longestDistance:Int, _walls:Int)
	{
		var benchmark = Xml.createElement("benchmark");
		var a = Xml.createElement("executionTime");
		var aa = Xml.createPCData(Std.string(_execTime));
		a.addChild(aa);
		benchmark.addChild(a);
		
		var b = Xml.createElement("longestPath");
		var bb = Xml.createPCData(Std.string(_longestPath));
		b.addChild(bb);
		benchmark.addChild(b);
		
		var c = Xml.createElement("topDistance");
		var cc = Xml.createPCData(Std.string(_longestDistance));
		c.addChild(cc);
		benchmark.addChild(c);
		
		var d = Xml.createElement("wallCount");
		var dd = Xml.createPCData(Std.string(_walls));
		d.addChild(dd);
		benchmark.addChild(d);
		
		/*var b = Xml.createElement("longestPath");
		b.nodeValue = Std.string(_longestPath);
		benchmark.addChild(b);
		var c = Xml.createElement("topDistance");
		c.nodeValue = Std.string(_longestDistance);
		benchmark.addChild(c);
		var d = Xml.createElement("wallCount");
		d.nodeValue = Std.string(_walls);
		benchmark.addChild(d);*/
		//benchmark.set("executionTime", Std.string(_execTime));
		//benchmark.set("longestPath", Std.string(_longestPath));
		//benchmark.set("topDistance", Std.string(_longestDistance));
		//benchmark.set("wallCount", Std.string(_walls));
		output.addChild(benchmark);
	}
	
	public function CloseLog()
	{
		var ba:ByteArray = new ByteArray();
		ba.writeUTFBytes(Std.string(output));

		var fr:FileReference = new FileReference();

		fr.save(ba, "output.xml");
	}
	
}