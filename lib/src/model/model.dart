class Note {
  final Pitch pitch;
  final Type type;

  Note({this.pitch, this.type});
}

class Pitch {
  final Step step;
  final int octave;

  Pitch({this.step, this.octave});
}

class Time {
  final int beats;
  final int beatType;

  Time({this.beats, this.beatType});
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

enum Type {
  whole,
  half,
  quarter,
  eighth,
  sixteenth,
  thirtySecond,
  sixtyFourth,
}

enum Clef {
  treble,
  bass,
}

enum Rest {
  whole,
  half,
  quarter,
  eighth,
  sixteenth,
}