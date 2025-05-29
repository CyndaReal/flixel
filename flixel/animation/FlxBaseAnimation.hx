package flixel.animation;

import flixel.util.FlxDestroyUtil.IFlxDestroyable;

/**
 * @author Zaphod
 */
class FlxBaseAnimation implements IFlxDestroyable
{
	/**
	 * Animation controller this animation belongs to
	 */
	public var parent(default, null):FlxAnimationController;

	/**
	 * String name of the animation (e.g. `"walk"`)
	 */
	public var name:String;

	/**
	 * Keeps track of the current index into the tile sheet based on animation or rotation.
	 */
	public var curIndex(default, set):Int = 0;

	function set_curIndex(value:Int):Int
	{
		curIndex = value;
		
		if (parent != null && parent._curAnim == this)
		{
			parent.frameIndex = value;
		}

		return value;
	}

	public function new(parent:FlxAnimationController, name:String)
	{
		this.parent = parent;
		this.name = name;
	}

	public function destroy():Void
	{
		parent = null;
		name = null;
	}

	public function update(elapsed:Float):Void {}

	public function clone(parent:FlxAnimationController):FlxBaseAnimation
	{
		return null;
	}
}
