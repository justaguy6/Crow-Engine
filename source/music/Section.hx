package music;

class Section {}

typedef SectionInfo =
{
	var notes:Array<NoteInfo>;
	var lengthInSteps:Array<Int>;
	var bpm:Array<Float>;
}

typedef NoteInfo =
{
	var strumTime:Float;
	var direction:Int;
	var sustain:Float;
	var noteAnim:String;
	var noteType:String;
}
