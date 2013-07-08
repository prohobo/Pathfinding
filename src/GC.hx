package ;

/**
 * ...
 * @author Alex Klos
 */
//@:font("/src/ubuntu_reg.ttf") class Font_SSP_Reg extends flash.text.Font { }

class GC
{
	public static function GetIndex(_o:Dynamic, _list:Array<Dynamic>):Int
	{
		var index = -1;
		for (i in 0..._list.length)
		{
			if (_o == _list[i])
			{
				index = i;
				break;
			}
		}
		
		return index;
	}
}