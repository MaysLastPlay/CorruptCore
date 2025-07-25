package stages.objects;

class MallCrowd extends BGSprite
{
	public var heyTimer:Float = 0;
	public function new(x:Float = 0, y:Float = 0, sprite:String = 'bgs/christmas/bottomBop', idle:String = 'Bottom Level Boppers Idle', hey:String = 'Bottom Level Boppers HEY')
	{
		super(sprite, x, y, 0.9, 0.9, [idle]);
		animation.addByPrefix('hey', hey, 24, false);
		antialiasing = ClientPrefs.globalAntialiasing;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if(heyTimer > 0) {
			heyTimer -= elapsed;
			if(heyTimer <= 0) {
				dance(true);
				heyTimer = 0;
			}
		}
	}

	override function dance(?forceplay:Bool = false)
	{
		if(heyTimer > 0) return;
		super.dance(forceplay);
	}
}