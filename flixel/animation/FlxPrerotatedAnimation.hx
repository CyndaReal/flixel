package flixel.animation;

/**
 * @author Zaphod
 */
class FlxPrerotatedAnimation extends FlxBaseAnimation
{
	public static inline var PREROTATED:String = "prerotated_animation";

	var rotations:Int;

	var baked:Float;

	public function new(parent:FlxAnimationController, baked:Float)
	{
		super(parent, PREROTATED);
		this.baked = baked;
		rotations = Math.round(360 / baked);
	}

	public var angle(default, set):Float = 0;

	function set_angle(value:Float):Float
	{
		if (Math.isNaN(value))
			throw "angle must not be NaN";

		var oldIndex:Int = curIndex;
		var angleHelper:Int = Math.floor(value % 360);
		
		while (angleHelper < 0)
		{
			angleHelper += 360;
		}

		var newIndex:Int = Math.floor(angleHelper / baked + 0.5);
		newIndex = Std.int(newIndex % rotations);
		if (oldIndex != newIndex)
		{
			curIndex = newIndex;
		}

		return angle = value;
	}

	override function set_curIndex(value:Int):Int
	{
		curIndex = value;
		
		if (parent != null)
		{
			parent.frameIndex = value;
		}

		return value;
	}

	override public function clone(parent:FlxAnimationController):FlxPrerotatedAnimation
	{
		return new FlxPrerotatedAnimation(parent, baked);
	}
}
