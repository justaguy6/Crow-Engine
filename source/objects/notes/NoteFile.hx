package objects.notes;

// noteskin shit
typedef NoteFile =
{
	var animDirections:Array<String>;
	var sustainAnimDirections:Array<{end:String, body:String}>;

	var animationData:Array<Animation>;
	var atlasType:String;
	var scale:{x:Float, y:Float};
	@:optional var forcedAntialias:Null<Bool>;

	@:optional var scaledArrow:{x:Float, y:Float, type:String};
	@:optional var scaledHold:{x:Float, y:Float, type:String};
	@:optional var scaledEnd:{x:Float, y:Float, type:String};
}

typedef StrumNoteFile =
{
	var pressAnim:Array<String>;
	var staticAnim:Array<String>;
	var confirmAnim:Array<String>;

	var animationData:Array<Animation>;
	var atlasType:String;
	var scale:{x:Float, y:Float};

	@:optional var forcedAntialias:Null<Bool>;
}

// in case i ever need to combine the files

typedef FullNoteFile =
{
	var noteFile:NoteFile;
	var strumFile:StrumNoteFile;
}
