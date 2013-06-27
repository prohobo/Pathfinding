package ;
import com.eclecticdesignstudio.ui.SlideToggle;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.Lib;
import nme.text.TextField;
import nme.text.TextFormat;

/**
 * Show sliders and options for setting up environment and beginning simulation
 * @author Alex Klos
 */
class HUD extends Sprite
{
	private var agents:Int = 1;
	private var environment:Int = 0;
	private var algorithm:Int = 0;
	private var startBtn:Sprite;
	private var resetBtn:Sprite;
	
	private var tf:TextFormat;
	
	private var envText:TextField;
	private var envSlider:SlideToggle;
	
	private var algText:TextField;
	private var algSlider:SlideToggle;
	
	private var agtText:TextField;
	private var agtSlider:SlideToggle;
	
	public function new() 
	{
		super();
		
		var panel:Bitmap = new Bitmap(new BitmapData(320, 480, true, 0xFF111111));
		addChild(panel);
		
		tf = new TextFormat();
		tf.size = 22;
		tf.color = 0xFFFFFF;
		
		
		
		
		// environment slider
		envText = new TextField();
		envText.selectable = false;
		envText.text = "Environment: Static";
		envText.setTextFormat(tf);
		envText.width = 300;
		envText.x = 10;
		envText.y = 10;
		addChild(envText);
		
		var envBtnContainer:Sprite = new Sprite();
		var envBtn:Bitmap = new Bitmap(new BitmapData(40, 40, true, 0xFF333333));
		envBtnContainer.addChild(envBtn);
		
		var envTrackContainer:Sprite = new Sprite();
		var envTrack:Bitmap = new Bitmap(new BitmapData(280, 20, true, 0xFF222222));
		envTrackContainer.addChild(envTrack);
		
		envSlider = new SlideToggle(envTrackContainer, envBtnContainer, 3);
		envSlider.SlideTrack.x = 160 - envSlider.SlideTrack.width / 2;
		envSlider.SlideTrack.y = 60;
		envSlider.Slider.x = envSlider.SlideTrack.x;
		envSlider.Slider.y = envSlider.SlideTrack.y - 10;
		addChild(envSlider.SlideTrack);
		addChild(envSlider.Slider);
		
		
		
		
		// algorithm slider
		algText = new TextField();
		algText.selectable = false;
		algText.text = "Algorithm: A*";
		algText.setTextFormat(tf);
		algText.width = 300;
		algText.x = 10;
		algText.y = envSlider.Slider.y + envSlider.Slider.height + 10;
		addChild(algText);
		
		var algBtnContainer:Sprite = new Sprite();
		var algBtn:Bitmap = new Bitmap(new BitmapData(40, 40, true, 0xFF333333));
		algBtnContainer.addChild(algBtn);
		
		var algTrackContainer:Sprite = new Sprite();
		var algTrack:Bitmap = new Bitmap(new BitmapData(280, 20, true, 0xFF222222));
		algTrackContainer.addChild(algTrack);
		
		algSlider = new SlideToggle(algTrackContainer, algBtnContainer, 2);
		algSlider.SlideTrack.x = 160 - algSlider.SlideTrack.width / 2;
		algSlider.SlideTrack.y = algText.y + 50;
		algSlider.Slider.x = algSlider.SlideTrack.x;
		algSlider.Slider.y = algSlider.SlideTrack.y - 10;
		addChild(algSlider.SlideTrack);
		addChild(algSlider.Slider);
		
		
		
		
		// agents slider
		agtText = new TextField();
		agtText.selectable = false;
		agtText.text = "Agents: 1";
		agtText.setTextFormat(tf);
		agtText.width = 300;
		agtText.x = 10;
		agtText.y = algSlider.Slider.y + algSlider.Slider.height + 10;
		addChild(agtText);
		
		var agtBtnContainer:Sprite = new Sprite();
		var agtBtn:Bitmap = new Bitmap(new BitmapData(40, 40, true, 0xFF333333));
		agtBtnContainer.addChild(agtBtn);
		
		var agtTrackContainer:Sprite = new Sprite();
		var agtTrack:Bitmap = new Bitmap(new BitmapData(280, 20, true, 0xFF222222));
		agtTrackContainer.addChild(agtTrack);
		
		agtSlider = new SlideToggle(agtTrackContainer, agtBtnContainer, 50);
		agtSlider.SlideTrack.x = 160 - agtSlider.SlideTrack.width / 2;
		agtSlider.SlideTrack.y = agtText.y + 50;
		agtSlider.Slider.x = agtSlider.SlideTrack.x;
		agtSlider.Slider.y = agtSlider.SlideTrack.y - 10;
		addChild(agtSlider.SlideTrack);
		addChild(agtSlider.Slider);
		
		
		
		
		// start button
		startBtn = new Sprite();
		startBtn.buttonMode = true;
		var startBtnBmp:Bitmap = new Bitmap(new BitmapData(120, 60, true, 0xFF333333));
		startBtn.addChild(startBtnBmp);
		startBtn.x = 160 - startBtn.width - 20;
		startBtn.y = 480 - startBtn.height - 20;
		
		var btnTf:TextFormat = new TextFormat();
		btnTf.size = 22;
		btnTf.color = 0xFFFFFF;
		
		var startBtnText:TextField = new TextField();
		startBtnText.selectable = false;
		startBtnText.mouseEnabled = false;
		startBtnText.text = "Start";
		startBtnText.setTextFormat(btnTf);
		startBtnText.width = 80;
		startBtnText.x = 37;
		startBtnText.y = 15;
		startBtn.addChild(startBtnText);
		
		startBtn.addEventListener(MouseEvent.CLICK, StartBtnClick);
		addChild(startBtn);
		
		
		
		
		// reset button
		resetBtn = new Sprite();
		resetBtn.buttonMode = true;
		var resetBtnBmp:Bitmap = new Bitmap(new BitmapData(120, 60, true, 0xFF333333));
		resetBtn.addChild(resetBtnBmp);
		resetBtn.x = 160 + 20;
		resetBtn.y = 480 - resetBtn.height - 20;
		
		var resetBtnText:TextField = new TextField();
		resetBtnText.selectable = false;
		resetBtnText.mouseEnabled = false;
		resetBtnText.text = "Reset";
		resetBtnText.setTextFormat(btnTf);
		resetBtnText.width = 80;
		resetBtnText.x = 34;
		resetBtnText.y = 15;
		resetBtn.addChild(resetBtnText);
		
		resetBtn.addEventListener(MouseEvent.CLICK, ResetBtnClick);
		addChild(resetBtn);
		
		addEventListener(Event.ENTER_FRAME, Update);
	}
	
	
	private function Update(e:Event)
	{
		switch (envSlider.column)
		{
			case 1:
				envText.text = "Environment: Static";
				envText.setTextFormat(tf);
				environment = 0;
			case 2:
				envText.text = "Environment: Dynamic";
				envText.setTextFormat(tf);
				environment = 1;
			case 3:
				envText.text = "Environment: Following (static)";
				envText.setTextFormat(tf);
				environment = 2;
		}
		
		switch (algSlider.column)
		{
			case 1:
				algText.text = "Algorithm: A*";
				algText.setTextFormat(tf);
				algorithm = 0;
			case 2:
				algText.text = "Algorithm: Basic Theta*";
				algText.setTextFormat(tf);
				algorithm = 1;
		}
		
		agents = agtSlider.column;
		if (agents == 0) agents = 1;
		agtText.text = "Agents: " + Std.string(agents);
		agtText.setTextFormat(tf);
	}
	
	private function StartBtnClick(e:MouseEvent)
	{
		GV.env = environment;
		GV.alg = algorithm;
		GV.agt = agents;
		
		GV.currentEnv = new StaticEnv();
		this.parent.addChild(GV.currentEnv);
		startBtn.removeEventListener(MouseEvent.CLICK, StartBtnClick);
	}
	
	private function ResetBtnClick(e:MouseEvent)
	{
		//this.parent.removeChild(GV.currentEnv);
		//startBtn.addEventListener(MouseEvent.CLICK, StartBtnClick);
	}
	
}