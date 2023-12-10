bool disablelist = false;  // D#2 and E2
bool disablelist1 = false; // E2


String x = 'Selamta';
String y = 'A1 Major';

void xx (String text){
  x = text;
}
void yy (String text){
  y = text;
}
String getx(){
  return x;
}
String gety(){
  return y;
}

  List<String> kignit = [
   'Selamta',
    'Wane',
    'Selcherneth',
    'Ambasel',
    'Tizeta Minor',
    'Bati Major',
    'Bati Minor'
  ];

List<String> major = [
'A1 Major',
'A#1 Major',
'B1 Major',
'C2 Major',
'C#2 Major',
'D2 Major',
'D#2 Major',
'E2 Major'
];

List<String> batimajor = [
'A1 Major',
'A#1 Major',
'B1 Major',
'C2 Major',
'C#2 Major',
'D2 Major',
];

List<String> batiminor = [
'A1 Major',
'A#1 Major',
'B1 Major',
'C2 Major',
'C#2 Major',
'D2 Major',
'D#2 Major'
];

List<List<String>> stringname = 
  [
    [ 'D2', 'A1', 'B1', 'F#2', 'E2'],
    ['D#2', 'A#1', 'C2', 'G2', 'F2'],
    ['E2', 'B1', 'C#2', 'G#2', 'F#2'],
    ['F2', 'C2', 'D2', 'A2', 'G2'],
    ['F#2','C#2', 'D#2', 'A#2', 'G#2'],
    ['G2', 'D2', 'E2', 'B2', 'A2'],
    ['G#2', 'D#2', 'F2', 'C3', 'A#2'],
    ['A2', 'E2', 'F#2', 'C#3', 'B2'],
    ['C#2', 'A1', 'B1', 'F#2', 'E2'],
    ['D2', 'A#1',  'C2', 'G2', 'F2'],
    ['D#2', 'B1', 'C#2', 'G#2', 'F#2'],
    ['E2', 'C2', 'D2', 'A2', 'G2'],
    ['F2', 'C#2', 'D#2', 'A#2', 'G#2'],
    ['F#2',  'D2', 'E2', 'B2', 'A2'],
    ['G2',  'D#2', 'F2', 'C3', 'A#2'],
    ['G#2',  'E2', 'F#2', 'C#3', 'B2'],    
    ['D2', 'A1', 'A#1', 'F#2', 'D#2'],
    ['D#2', 'A#1', 'B1', 'G2', 'E2'],
    ['E2', 'B1', 'C2', 'G#2', 'F2'],
    ['F2', 'C2', 'C#2', 'A2', 'F#2'],
    ['F#2', 'C#2', 'D2', 'A#2', 'G2'],
    ['G2', 'D2', 'D#2', 'B2', 'G#2'],
    ['G#2', 'D#2', 'E2', 'C3', 'A2'],
    ['A2',   'E2', 'F2', 'C#3', 'A#2'],
    ['D2', 'A1', 'A#1', 'F2', 'E2'],
    ['D#2', 'A#1', 'B1', 'F#2', 'F2'],
    ['E2',   'B1', 'C2', 'G2', 'F#2'],
    ['F2',  'C2', 'C#2', 'G#2', 'G2'],
    ['F#2', 'C#2', 'D2',  'A2',  'G#2'],
    ['G2',   'D2', 'D#2', 'A#2', 'A2'],
    ['G#2', 'D#2', 'E2', 'B2', 'A#2'],
    ['A2',   'E2', 'F2', 'C3',  'B2'],
    ['C2', 'A1', 'B1', 'F2', 'E2'],
    ['C#2', 'A#1', 'C2', 'F#2', 'F2'],
    ['D2', 'B1', 'C#2', 'G2', 'F#2'],
    ['D#2', 'C2', 'D2', 'G#2', 'G2'],
    ['E2', 'C#2',  'D#2', 'A2','G#2'],
    ['F2',  'D2', 'E2', 'A#2', 'A2'],
    ['F#2', 'D#2', 'F2', 'B2', 'A#2'],
    ['G2',   'E2', 'F#2', 'C3',  'B2'],
    ['D2', 'A1', 'C#2', 'G#2', 'E2'],
    ['D#2', 'A#1', 'D2', 'A2', 'F2'],
    ['E2', 'B1', 'D#2', 'A#2', 'F#2'],
    ['F2', 'C2', 'E2',  'B2', 'G2'],
    ['F#2', 'C#2', 'F2',  'C3', 'G#2'],
    ['G2','D2', 'F#2', 'C#3', 'A2'],
    ['D2', 'A1', 'C2', 'G2',  'E2'],
    ['D#2', 'A#1', 'C#2', 'G#2', 'F2'],
    ['E2', 'B1', 'D2', 'A2', 'F#2'],
    ['F2', 'C2', 'D#2', 'A#2', 'G2'],
    ['F#2', 'C#2', 'E2',  'B2',  'G#2'],
    ['G2', 'D2', 'F2', 'C3', 'A2'],
    ['G#2', 'D#2', 'F#2', 'C#3', 'A#2'],
  ];