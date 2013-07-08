package ;
import flash.display.Sprite;
import ui.OptionsPanel;

/**
 * ...
 * @author Alex Klos
 */

class MainContainer extends Sprite
{
	
	public function new() 
	{
		super();
		
		addChild(new OptionsPanel());
		addChild(new VisualizationPanel());
		addChild(new OutputPanel());
	}
	
}