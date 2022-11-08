package;

import backend.DebugInfo;
import flixel.FlxG;
import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;
import lime.ui.Window;
import lime.app.Application;

class Main extends Sprite
{
	var game = {
		width: 1280, // Game Width
		height: 720, // Game Height
		zoom: -1.0, // Zoom automatically calculates if -1
		initialState: states.menus.TitleState, // The State when the game starts
		framerate: 60, // Default Framerate of the Game
		skipSplash: true, // Skipping Flixel's Splash Screen
		startFullscreen: false // If the game should start fullscreen
	};

	// game version's number is 7 because of week 6
	public static final gameVersion:VersionScheme = {display: "0.2.7.1", number: 7}; // Version Of The Base Game (Friday Night Funkin')
	public static final engineVersion:VersionScheme = {display: "0.1.0A", number: 1}; // Version Of The Engine (Crow Engine)

	public static function main():Void
	{
		Lib.current.addChild(new Main());
	}

	public function new()
	{
		super();

		// splashScreen();

		if (game.framerate > 900)
		{
			game.framerate = 900;
		}

		if (stage != null)
		{
			init();
		}
		else
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(?E:Event):Void
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		setupGame();
	}

	private function setupGame():Void
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		// -1.0 to tell its a Float, instead of having -1 as an Int
		if (game.zoom == -1.0)
		{
			var ratioX:Float = stageWidth / game.width;
			var ratioY:Float = stageHeight / game.height;
			game.zoom = Math.min(ratioX, ratioY);
			game.width = Math.ceil(stageWidth / game.zoom);
			game.height = Math.ceil(stageHeight / game.zoom);
		}

		var game:FlxGame = new FlxGame(game.width, game.height, game.initialState, game.zoom, game.framerate, game.framerate, game.skipSplash,
			game.startFullscreen);

		addChild(game);

		FlxG.console.registerClass(utils.Paths);
		FlxG.console.registerClass(utils.Tools);
		FlxG.console.registerClass(backend.Settings);
		FlxG.console.registerClass(music.Song);

		Application.current.window.onClose.add(function()
		{
			FlxG.save.data.settings = Settings.prefs;

			FlxG.save.flush();
		});

		#if !mobile
		addChild(new DebugInfo(10, 5));
		#end

		FlxG.game.stage.quality = openfl.display.StageQuality.LOW; // try and remove openfl's smoothing??
	}
}

/*Helper class to classify versions.
 * 
 * `display`: Display version
 * `number`: Number version
 * @return {display: '', number: 0}
 */
typedef VersionScheme =
{
	var display:String;
	var number:Int;
}
