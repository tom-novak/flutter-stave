import 'package:flutter/cupertino.dart';

enum ScoreType {
  partwise,
  timewise,
}

class Score {
  final ScoreType type;
  final String version;
  final List<Part> parts;

  Score({@required this.type, this.version, this.parts});
}

enum Clef {
  treble,
  bass,
}

class Time {
  final int beats;
  final int beatType;

  Time({@required this.beats, @required this.beatType});
}

class Attributes {
  final Time time;
  final Clef clef;

  Attributes({@required this.time,@required this.clef});
}

class Measure {
  final Attributes attributes;
  final List<Note> notes;

  Measure({this.attributes, this.notes});
}

class Part {
  final String id;
  final List<Measure> measures;

  Part({this.id, this.measures});
}

enum Step {
  a,
  b,
  c,
  d,
  e,
  f,
  g,
}

class Pitch {
  final Step step;
  final int octave;

  Pitch({this.step, this.octave});
}

enum NoteType {
  whole,
  half,
  quarter,
  eighth,
  sixteenth,
  thirtySecond,
  sixtyFourth,
}

class Note {
  final Pitch pitch;
  final NoteType type;

  Note({this.pitch, this.type});
}

enum Rest {
  whole,
  half,
  quarter,
  eighth,
  sixteenth,
}