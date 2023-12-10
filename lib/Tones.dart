
import 'package:just_audio/just_audio.dart';
import 'constant.dart';

final AudioPlayer _player1 = AudioPlayer();
final AudioPlayer _player2 = AudioPlayer();
final AudioPlayer _player3 = AudioPlayer();
final AudioPlayer _player4 = AudioPlayer();
final AudioPlayer _player5 = AudioPlayer();


String Asharp1 = "assets/begena_sounds/Asharp1.mp3";
String Asharp2 = "assets/begena_sounds/Asharp2.mp3";
String A1 =  "assets/begena_sounds/A1.mp3";
String A2 = "assets/begena_sounds/A2.mp3";
String B1 = "assets/begena_sounds/B1.mp3";
String B2 = "assets/begena_sounds/B2.mp3";
String Csharp2 = "assets/begena_sounds/csharp2.mp3";
String Csharp3 =  "assets/begena_sounds/Csharp3.mp3";
String C2 =  "assets/begena_sounds/C2.mp3";
String C3 = "assets/begena_sounds/C3.mp3";
String Dsharp2 = "assets/begena_sounds/Dsharp2.mp3";
String D2 =  "assets/begena_sounds/D2.mp3";
String E2 = "assets/begena_sounds/E2.mp3";
String Fsharp2 = "assets/begena_sounds/Fsharp2.mp3";
String F2 = "assets/begena_sounds/F2.mp3";
String Gsharp2 = "assets/begena_sounds/Gsharp2.mp3";
String G2 = "assets/begena_sounds/G2.mp3" ;

List<String> stringnow = [
  D2, A1, B1, Fsharp2, E2
];

int num = 0;
String selected = "Selamta";

int n (){
  return num;
}




// ignore: non_constant_identifier_names
void Tones2(String text1,String text) {
  selected = text1;
  if (selected == "Selamta") {

        stringnow.clear();
    
      if (text == "A1 Major"){
     //   stringname[0]= [D2, A1, B1, Fsharp2, E2];
        stringnow.addAll([D2, A1, B1, Fsharp2, E2]);
        num = 0; 
      }
      else if ( text == "A#1 Major"){
       //   stringname[0]=[Dsharp2, Asharp1, C2, G2, F2];
        stringnow.addAll([Dsharp2, Asharp1, C2, G2, F2]);
        num = 1;
      }else if (text == "B1 Major"){

        stringnow.addAll([E2, B1, Csharp2, Gsharp2, Fsharp2]);
        num = 2; 
      }else if (text ==  "C2 Major"){

        stringnow.addAll([F2, C2, D2, A2, G2]);
        num = 3; 
      }else if ( text == "C#2 Major"){

        stringnow.addAll([Fsharp2, Csharp2, Dsharp2, Asharp2, Gsharp2]);
        num = 4;
      }else if (text == "D2 Major"){

        stringnow.addAll([G2, D2, E2, B2, A2]);
        num = 5;
      }else if (text ==  "D#2 Major"){

        stringnow.addAll([Gsharp2, Dsharp2, F2, C3, Asharp2]);
        num = 6; 
      }else if (text ==  "E2 Major"){

        stringnow.addAll([A2, E2, Fsharp2, Csharp3, B2]);
        num = 7;
      }
  
  }
  
  else if (selected == "Wane") {
    
       stringnow.clear();

      if (text == "A1 Major"){

        stringnow.addAll([Csharp2, A1, B1, Fsharp2, E2]);
        num = 8;    
      }
      else if ( text == "A#1 Major"){

        stringnow.addAll([ D2, Asharp1,  C2, G2, F2]);
        num = 9;
      }else if (text == "B1 Major"){

        stringnow.addAll([Dsharp2,  B1, Csharp2, Gsharp2, Fsharp2]);
        num = 10;
      }else if (text ==  "C2 Major"){

        stringnow.addAll([E2, C2, D2, A2, G2]);
        num = 11; 
      }else if ( text == "C#2 Major"){

        stringnow.addAll([F2,  Csharp2, Dsharp2, Asharp2, Gsharp2]);
        num = 12;
      }else if (text == "D2 Major"){

        stringnow.addAll([Fsharp2,  D2, E2, B2, A2]);
        num = 13;
      }else if (text ==  "D#2 Major"){

        stringnow.addAll([G2,  Dsharp2, F2, C3, Asharp2,]);
        num = 14;
      }else if (text ==  "E2 Major"){

        stringnow.addAll([Gsharp2,  E2, Fsharp2, Csharp3, B2]);
        num = 15; 
      }

  }
  
  
  
  else if (selected == "Selcherneth") {
    
       stringnow.clear();

      if (text == "A1 Major"){

         stringnow.addAll([D2, A1, Asharp1, Fsharp2, Dsharp2]);
         num = 16; 
      }
      else if ( text == "A#1 Major"){
         
         stringnow.addAll([Dsharp2, Asharp1, B1, G2, E2]);
         num = 17;
      }else if (text == "B1 Major"){

         stringnow.addAll([E2, B1, C2, Gsharp2, F2]);
         num = 18;
      }else if (text ==  "C2 Major"){

         stringnow.addAll([F2, C2, Csharp2, A2, Fsharp2,]);
         num = 19;
      }else if ( text == "C#2 Major"){

         stringnow.addAll([Fsharp2, Csharp2, D2, Asharp2,  G2]);
         num = 20;
      }else if (text == "D2 Major"){

         stringnow.addAll([G2,   D2, Dsharp2, B2, Gsharp2]);
         num = 21;
      }else if (text ==  "D#2 Major"){

         stringnow.addAll([Gsharp2, Dsharp2, E2, C3, A2]);
         num = 22; 
      }else if (text ==  "E2 Major"){

         stringnow.addAll([A2,   E2, F2, Csharp3, Asharp2]);
         num = 23;

      }
  }
  
  
  else if (selected == "Ambasel") {
    
         stringnow.clear();

      if (text == "A1 Major"){

         stringnow.addAll([D2, A1, Asharp1, F2, E2]);
         num = 24; 
      }
      else if ( text == "A#1 Major"){

         stringnow.addAll([Dsharp2, Asharp1, B1, Fsharp2, F2]);
         num = 25;
      }else if (text == "B1 Major"){

         stringnow.addAll([E2,   B1, C2, G2, Fsharp2]);
         num = 26;
      }else if (text ==  "C2 Major"){

         stringnow.addAll([F2,   C2, Csharp2, Gsharp2, G2]);
         num = 27;
      }else if ( text == "C#2 Major"){

         stringnow.addAll([Fsharp2, Csharp2, D2,  A2,  Gsharp2]);
         num = 28;
      }else if (text == "D2 Major"){

         stringnow.addAll([G2,   D2, Dsharp2, Asharp2, A2]);
         num = 29;
      }else if (text ==  "D#2 Major"){

         stringnow.addAll([Gsharp2, Dsharp2, E2, B2, Asharp2]);
         num = 30;
      }else if (text ==  "E2 Major"){

         stringnow.addAll([A2,   E2, F2, C3,  B2]);
         num = 31;
      }
  }
  
  
  else if (selected == "Tizeta Minor") {
    
       stringnow.clear();

      if (text == "A1 Major"){

         stringnow.addAll([C2, A1, B1, F2, E2]);
         num = 32; 
      }
      else if ( text == "A#1 Major"){

         stringnow.addAll([Csharp2, Asharp1, C2, Fsharp2, F2]);
         num = 33; 
      }else if (text == "B1 Major"){

         stringnow.addAll([D2,   B1, Csharp2, G2, Fsharp2]);
         num = 34;
      }else if (text ==  "C2 Major"){

         stringnow.addAll([Dsharp2,   C2, D2, Gsharp2, G2]);
         num = 35;
      }else if ( text == "C#2 Major"){

         stringnow.addAll([E2, Csharp2,  Dsharp2,  A2,  Gsharp2]);
         num = 36;
      }else if (text == "D2 Major"){

         stringnow.addAll([F2,   D2, E2, Asharp2, A2]);
         num = 37;
      }else if (text ==  "D#2 Major"){

         stringnow.addAll([Fsharp2, Dsharp2, F2, B2, Asharp2]);
         num = 38;
      }else if (text ==  "E2 Major"){

         stringnow.addAll([G2,   E2, Fsharp2, C3,  B2]);
         num = 39;
      }
  } 
  
  
  else if (selected == "Bati Major") {
    
       stringnow.clear();

      if (text == "A1 Major"){
         stringnow.addAll([D2, A1, Csharp2, Gsharp2, E2]);
         num = 40;
      }
      else if ( text == "A#1 Major"){

         stringnow.addAll([Dsharp2, Asharp1, D2, A2, F2]);
         num  = 41;
      }else if (text == "B1 Major"){

         stringnow.addAll([E2, B1, Dsharp2, Asharp2, Fsharp2]);
         num = 42;
      }else if (text ==  "C2 Major"){

         stringnow.addAll([F2, C2, E2,  B2, G2]);
         num = 43;
      }else if ( text == "C#2 Major"){

         stringnow.addAll([Fsharp2, Csharp2, F2,  C3, Gsharp2]);
         num = 44;
      }else if (text == "D2 Major"){
         stringnow.addAll([G2,   D2, Fsharp2, Csharp3, A2]);
         num = 45;
      }
      else{
        stringnow.addAll([D2, A1, Csharp2, Gsharp2, E2]);
         num = 40;
      }
  }
  
  
  else if (selected == "Bati Minor") {
    
       stringnow.clear();

      if (text == "A1 Major"){

         stringnow.addAll([D2, A1, C2, G2,  E2]);
         num = 46;
      }
      else if ( text == "A#1 Major"){

         stringnow.addAll([Dsharp2, Asharp1, Csharp2, Gsharp2, F2]);
         num = 47;
      }else if (text == "B1 Major"){

         stringnow.addAll([E2,   B1, D2, A2, Fsharp2]);
         num = 48;
      }else if (text ==  "C2 Major"){

         stringnow.addAll([F2,   C2, Dsharp2, Asharp2, G2]);
         num = 49;
      }else if ( text == "C#2 Major"){

         stringnow.addAll([Fsharp2, Csharp2, E2,  B2,  Gsharp2]);
         num = 50;
      }else if (text == "D2 Major"){
         stringnow.addAll([G2,   D2, F2, C3, A2]);
         num = 51;
      }else if (text ==  "D#2 Major"){
         stringnow.addAll([Gsharp2, Dsharp2, Fsharp2, Csharp3, Asharp2]);
         num = 52;
      } 
      else{
                stringnow.addAll([D2, A1, C2, G2,  E2]);
         num = 46;
      }
  }
  print("number $num");
}

// ignore: non_constant_identifier_names
void String1() {
  _player1.setAsset(stringnow[0]);
  _player1.play();
}

// ignore: non_constant_identifier_names
void String2() {
  _player2.setAsset(stringnow[1]);
  _player2.play();
}

// ignore: non_constant_identifier_names
void String3() {
  _player3.setAsset(stringnow[2]);
  _player3.play();
}

// ignore: non_constant_identifier_names
void String4() {
  _player4.setAsset(stringnow[3]);
  _player4.play();
}

// ignore: non_constant_identifier_names
void String5() {
  _player5.setAsset(stringnow[4]);
  _player5.play();
}


void setvolum(double value) {
  _player1.setVolume(value);
  _player2.setVolume(value);
  _player3.setVolume(value);
  _player4.setVolume(value);
  _player5.setVolume(value);
}
