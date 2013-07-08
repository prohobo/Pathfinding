package ui;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

/**
 * ...
 * @author Alex Klos
 */
class OptionsPanel extends Sprite
{
	private var algoOptionSlider:OptionSlider;
	private var searchSpaceOptionSlider:OptionSlider;
	private var agentSlider:SlideBar;
	private var tweaksOptionSlider:OptionSlider;
	
	private var panel:Sprite;
	
	private var startBtn:Button;
	private var pauseBtn:Button;
	private var resetBtn:Button;
	
	public function new() 
	{
		super();
		
		panel = new Sprite();
		addChild(panel);
		var panelBg:Bitmap = new Bitmap(new BitmapData(200, 480, true, 0xff323232));
		panel.addChild(panelBg);
		
		// label text format
		var labelTF:TextFormat = new TextFormat();
		labelTF.font = "SSP-BlackIt";
		labelTF.color = 0xc3c3c3;
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
		title.x = panelBg.width / 2 - title.width / 2;
		title.y = 10;
		panel.addChild(title);
		
		// LINE
		var line:Bitmap = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panelBg.width / 2 - line.width / 2;
		line.y = title.y + title.height + 10;
		panel.addChild(line);
		
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
		panel.addChild(algoLabel);
		
		algoOptionSlider = new OptionSlider();
		
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
		
		algoOptionSlider.x = panelBg.width / 2 - algoOptionSlider.containerBox.width / 2;
		algoOptionSlider.y = algoLabel.y + algoLabel.height + 10;
		
		panel.addChild(algoOptionSlider);
		
		// LINE
		line = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panelBg.width / 2 - line.width / 2;
		line.y = algoLabel.y + algoLabel.height + 60;
		panel.addChild(line);
		
		// search space (rect grid, quad tree)
		var searchSpaceLabel:TextField = new TextField();
		searchSpaceLabel.text = "Search space:";
		searchSpaceLabel.autoSize = TextFieldAutoSize.LEFT;
		searchSpaceLabel.embedFonts = true;
		searchSpaceLabel.mouseEnabled = false;
		searchSpaceLabel.setTextFormat(labelTF);
		searchSpaceLabel.x = 10;
		searchSpaceLabel.y = line.y + 10;
		panel.addChild(searchSpaceLabel);
		
		// OPTION SLIDER //
		
		searchSpaceOptionSlider = new OptionSlider();
		
		box = new Bitmap(new BitmapData(180, 40, true, 0x33000000));
		searchSpaceOptionSlider.containerBox.addChild(box);
		
		// OPTIONS //
		
		option1 = new Sprite();
		
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
		
		var option2 = new Sprite();
		
		var o2Bg = new Bitmap(new BitmapData(180, 40, true, 0xfff3f3f3));
		option2.addChild(o2Bg);
		var o2Text = new TextField();
		o2Text.text = "Quadtree";
		o2Text.autoSize = TextFieldAutoSize.CENTER;
		o2Text.embedFonts = true;
		o2Text.mouseEnabled = false;
		o2Text.setTextFormat(optionTF);
		o2Text.x = o2Bg.width / 2 - o2Text.width / 2;
		o2Text.y = o2Bg.height / 2 - o2Text.height / 2;
		option2.addChild(o2Text);
		
		option2.x = 180;
		
		searchSpaceOptionSlider.options.addChild(option2);
		
		// END OF OPTIONS //
		
		searchSpaceOptionSlider.x = panelBg.width / 2 - searchSpaceOptionSlider.containerBox.width / 2;
		searchSpaceOptionSlider.y = searchSpaceLabel.y + searchSpaceLabel.height + 10;
		
		panel.addChild(searchSpaceOptionSlider);
		
		// END OF OPTION SLIDER //
		
		// LINE
		line = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panelBg.width / 2 - line.width / 2;
		line.y = searchSpaceLabel.y + searchSpaceLabel.height + 60;
		panel.addChild(line);
		
		// agents (1-100)
		var agentsLabel:TextField = new TextField();
		agentsLabel.text = "Agents:";
		agentsLabel.autoSize = TextFieldAutoSize.LEFT;
		agentsLabel.embedFonts = true;
		agentsLabel.mouseEnabled = false;
		agentsLabel.setTextFormat(labelTF);
		agentsLabel.x = 10;
		agentsLabel.y = line.y + 10;
		panel.addChild(agentsLabel);
		
		// SLIDE TOGGLE //
		
		agentSlider = new SlideBar(1, 100);
		agentSlider.x = panelBg.width / 2 - agentSlider.width / 2;
		agentSlider.y = agentsLabel.y + agentsLabel.height + 10;
		panel.addChild(agentSlider);
		
		// LINE
		line = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panelBg.width / 2 - line.width / 2;
		line.y = agentsLabel.y + agentsLabel.height + 60;
		panel.addChild(line);
		
		// tweaks (not official algos, but basic optimizations)
		var tweaksLabel:TextField = new TextField();
		tweaksLabel.text = "Tweaks:";
		tweaksLabel.autoSize = TextFieldAutoSize.LEFT;
		tweaksLabel.embedFonts = true;
		tweaksLabel.mouseEnabled = false;
		tweaksLabel.setTextFormat(labelTF);
		tweaksLabel.x = 10;
		tweaksLabel.y = line.y + 10;
		panel.addChild(tweaksLabel);
		
		// OPTION SLIDER //
		
		tweaksOptionSlider = new OptionSlider();
		
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
		
		tweaksOptionSlider.x = panelBg.width / 2 - tweaksOptionSlider.containerBox.width / 2;
		tweaksOptionSlider.y = tweaksLabel.y + tweaksLabel.height + 10;
		
		panel.addChild(tweaksOptionSlider);
		
		// END OF OPTION SLIDER //
		
		// LINE
		line = new Bitmap(new BitmapData(180, 1, true, 0xfff1f2f2));
		line.x = panelBg.width / 2 - line.width / 2;
		line.y = tweaksLabel.y + tweaksLabel.height + 60;
		panel.addChild(line);
		
		// BUTTONS //
		var startBtnGfx:Sprite = new Sprite();
		var sbBg:Bitmap = new Bitmap(new BitmapData(55, 40, true, 0xffc3c3c3));
		startBtnGfx.addChild(sbBg);
		
		startBtn = new Button(startBtnGfx, "Start");
		startBtn.x = 10;
		startBtn.y = line.y + 10;
		addChild(startBtn);
		
		var pauseBtnGfx:Sprite = new Sprite();
		var pbBg:Bitmap = new Bitmap(new BitmapData(55, 40, true, 0xffc3c3c3));
		pauseBtnGfx.addChild(pbBg);
		
		pauseBtn = new Button(pauseBtnGfx, "Pause");
		pauseBtn.x = startBtn.x + startBtn.width + 7;
		pauseBtn.y = line.y + 10;
		addChild(pauseBtn);
		
		var resetBtnGfx:Sprite = new Sprite();
		var rbBg:Bitmap = new Bitmap(new BitmapData(55, 40, true, 0xffc3c3c3));
		resetBtnGfx.addChild(rbBg);
		
		resetBtn = new Button(resetBtnGfx, "Reset");
		resetBtn.x = pauseBtn.x + pauseBtn.width + 7;
		resetBtn.y = line.y + 10;
		addChild(resetBtn);
		
		startBtn.addEventListener(MouseEvent.CLICK, StartBtnClick);
	}
	
	private function StartBtnClick(e:MouseEvent)
	{
		startBtn.removeEventListener(MouseEvent.CLICK, StartBtnClick);
		
		GV.algorithm = algoOptionSlider.selectedOption;
		GV.searchSpace = searchSpaceOptionSlider.selectedOption;
		GV.agentCount = Std.int(agentSlider.value);
		GV.tweak = tweaksOptionSlider.selectedOption;
		
		GV.visPanelRef.Begin();
		
		pauseBtn.addEventListener(MouseEvent.CLICK, PauseBtnClick);
		resetBtn.addEventListener(MouseEvent.CLICK, ResetBtnClick);
	}
	
	private function PauseBtnClick(e:MouseEvent)
	{
		pauseBtn.removeEventListener(MouseEvent.CLICK, PauseBtnClick);
		startBtn.addEventListener(MouseEvent.CLICK, StartBtnClick);
		
		// pause
	}
	
	private function ResetBtnClick(e:MouseEvent)
	{
		resetBtn.removeEventListener(MouseEvent.CLICK, ResetBtnClick);
		
		// clear screen
		GV.visPanelRef.Reset();
	}
	
}