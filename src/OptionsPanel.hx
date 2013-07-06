package ;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

/**
 * ...
 * @author Alex Klos
 */
class OptionsPanel extends Sprite
{
	public function new() 
	{
		super();
		
		var panel:Bitmap = new Bitmap(new BitmapData(200, 480, true, 0xffffffff));
		addChild(panel);
		
		// label text format
		var labelTF:TextFormat = new TextFormat();
		labelTF.font = "SSP-BlackIt";
		labelTF.color = 0x323232;
		labelTF.size = 16;
		
		// option text format
		var optionTF:TextFormat = new TextFormat();
		optionTF.font = "SSP-Regular";
		optionTF.color = 0x323232;
		optionTF.size = 16;
		
		// title
		var title:TextField = new TextField();
		title.text = "Pathfinding Algo. Test";
		title.autoSize = TextFieldAutoSize.LEFT;
		title.embedFonts = true;
		title.mouseEnabled = false;
		title.setTextFormat(labelTF);
		title.x = panel.width / 2 - title.width / 2;
		title.y = 10;
		addChild(title);
		
		// LINE
		var line:Bitmap = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panel.width / 2 - line.width / 2;
		line.y = title.y + title.height + 10;
		addChild(line);
		
		labelTF.font = "SSP-SemiboldIt";
		
		// algo (A*, JPS, Theta *)
		var algoLabel:TextField = new TextField();
		algoLabel.text = "Algorithm:";
		algoLabel.autoSize = TextFieldAutoSize.LEFT;
		algoLabel.embedFonts = true;
		algoLabel.mouseEnabled = false;
		algoLabel.setTextFormat(labelTF);
		algoLabel.x = 10;
		algoLabel.y = line.y + 10;
		addChild(algoLabel);
		
		var algoOptionSlider:OptionSlider = new OptionSlider();
		
		var box:Bitmap = new Bitmap(new BitmapData(180, 40, true, 0x33000000));
		algoOptionSlider.containerBox.addChild(box);
		
		var option1:Sprite = new Sprite();
		
		var o1Bg:Bitmap = new Bitmap(new BitmapData(180, 40, true, 0xfff3f3f3));
		option1.addChild(o1Bg);
		var o1Text:TextField = new TextField();
		o1Text.text = "A Star";
		o1Text.autoSize = TextFieldAutoSize.CENTER;
		o1Text.embedFonts = true;
		o1Text.mouseEnabled = false;
		o1Text.setTextFormat(optionTF);
		o1Text.x = o1Bg.width / 2 - o1Text.width / 2;
		o1Text.y = o1Bg.height / 2 - o1Text.height / 2;
		option1.addChild(o1Text);
		
		algoOptionSlider.options.addChild(option1);
		
		algoOptionSlider.x = panel.width / 2 - algoOptionSlider.containerBox.width / 2;
		algoOptionSlider.y = algoLabel.y + algoLabel.height + 10;
		
		addChild(algoOptionSlider);
		
		// LINE
		line = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panel.width / 2 - line.width / 2;
		line.y = algoLabel.y + algoLabel.height + 60;
		addChild(line);
		
		// search space (rect grid, quad tree)
		var searchSpaceLabel:TextField = new TextField();
		searchSpaceLabel.text = "Search space:";
		searchSpaceLabel.autoSize = TextFieldAutoSize.LEFT;
		searchSpaceLabel.embedFonts = true;
		searchSpaceLabel.mouseEnabled = false;
		searchSpaceLabel.setTextFormat(labelTF);
		searchSpaceLabel.x = 10;
		searchSpaceLabel.y = line.y + 10;
		addChild(searchSpaceLabel);
		
		// OPTION SLIDER //
		
		var searchSpaceOptionSlider:OptionSlider = new OptionSlider();
		
		box = new Bitmap(new BitmapData(180, 40, true, 0x33000000));
		searchSpaceOptionSlider.containerBox.addChild(box);
		
		option1 = new Sprite();
		
		// OPTIONS //
		
		o1Bg = new Bitmap(new BitmapData(180, 40, true, 0xfff3f3f3));
		option1.addChild(o1Bg);
		o1Text = new TextField();
		o1Text.text = "Rectangle Grid";
		o1Text.autoSize = TextFieldAutoSize.CENTER;
		o1Text.embedFonts = true;
		o1Text.mouseEnabled = false;
		o1Text.setTextFormat(optionTF);
		o1Text.x = o1Bg.width / 2 - o1Text.width / 2;
		o1Text.y = o1Bg.height / 2 - o1Text.height / 2;
		option1.addChild(o1Text);
		
		searchSpaceOptionSlider.options.addChild(option1);
		
		// END OF OPTIONS //
		
		searchSpaceOptionSlider.x = panel.width / 2 - searchSpaceOptionSlider.containerBox.width / 2;
		searchSpaceOptionSlider.y = searchSpaceLabel.y + searchSpaceLabel.height + 10;
		
		addChild(searchSpaceOptionSlider);
		
		// END OF OPTION SLIDER //
		
		// LINE
		line = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panel.width / 2 - line.width / 2;
		line.y = searchSpaceLabel.y + searchSpaceLabel.height + 60;
		addChild(line);
		
		// agents (1-100)
		var agentsLabel:TextField = new TextField();
		agentsLabel.text = "Agents:";
		agentsLabel.autoSize = TextFieldAutoSize.LEFT;
		agentsLabel.embedFonts = true;
		agentsLabel.mouseEnabled = false;
		agentsLabel.setTextFormat(labelTF);
		agentsLabel.x = 10;
		agentsLabel.y = line.y + 10;
		addChild(agentsLabel);
		
		// SLIDE TOGGLE //
		
		var agentSlider:SlideBar = new SlideBar(1, 100);
		agentSlider.x = panel.width / 2 - agentSlider.width / 2;
		agentSlider.y = agentsLabel.y + agentsLabel.height + 10;
		addChild(agentSlider);
		
		// LINE
		line = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panel.width / 2 - line.width / 2;
		line.y = agentsLabel.y + agentsLabel.height + 60;
		addChild(line);
		
		// tweaks (not official algos, but basic optimizations)
		var tweaksLabel:TextField = new TextField();
		tweaksLabel.text = "Tweaks:";
		tweaksLabel.autoSize = TextFieldAutoSize.LEFT;
		tweaksLabel.embedFonts = true;
		tweaksLabel.mouseEnabled = false;
		tweaksLabel.setTextFormat(labelTF);
		tweaksLabel.x = 10;
		tweaksLabel.y = line.y + 10;
		addChild(tweaksLabel);
		
		// OPTION SLIDER //
		
		var tweaksOptionSlider:OptionSlider = new OptionSlider();
		
		box = new Bitmap(new BitmapData(180, 40, true, 0x33000000));
		tweaksOptionSlider.containerBox.addChild(box);
		
		option1 = new Sprite();
		
		// OPTIONS //
		
		o1Bg = new Bitmap(new BitmapData(180, 40, true, 0xfff3f3f3));
		option1.addChild(o1Bg);
		o1Text = new TextField();
		o1Text.text = "None";
		o1Text.autoSize = TextFieldAutoSize.CENTER;
		o1Text.embedFonts = true;
		o1Text.mouseEnabled = false;
		o1Text.setTextFormat(optionTF);
		o1Text.x = o1Bg.width / 2 - o1Text.width / 2;
		o1Text.y = o1Bg.height / 2 - o1Text.height / 2;
		option1.addChild(o1Text);
		
		tweaksOptionSlider.options.addChild(option1);
		
		// END OF OPTIONS //
		
		tweaksOptionSlider.x = panel.width / 2 - tweaksOptionSlider.containerBox.width / 2;
		tweaksOptionSlider.y = tweaksLabel.y + tweaksLabel.height + 10;
		
		addChild(tweaksOptionSlider);
		
		// END OF OPTION SLIDER //
		
		// LINE
		line = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panel.width / 2 - line.width / 2;
		line.y = tweaksLabel.y + tweaksLabel.height + 60;
		addChild(line);
		
		// buttons
		
	}
	
}