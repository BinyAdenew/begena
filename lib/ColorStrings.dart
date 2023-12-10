// ignore: file_names
List<String> choose = [
"assets/Rive_/begenablack.riv",
"assets/Rive_/begenared.riv",
"assets/Rive_/begenabrown.riv",
"assets/Rive_/begenawhite.riv"
];
int numb = 0;
String choosedstring = 'black';
late int choosekerar;

void stringschoose(String index) {
  choosedstring = index;
  if (index == 'black') {
    numb = 0;
  } else if (index == 'red') {
    numb = 1;
  } else if (index == 'brown') {
    numb = 2;
  } else if (index == 'white') {
    numb = 3;
  } else {
    numb = 4;
  }
  print("the string is $index");
}

String mm() { // just chossen string 
  print("the number is  $numb");
 
  String x = choose[numb];
    print("the string is  $x");
  return choose[numb];
  
}

String assign() {  // which is assigned 
  return choosedstring;
}

String initkerar() { // the inital string
  return choose[numb];
}








void kerarsave(int index) {
  choosekerar = index;
}

int showkerar() {

  return choosekerar;
}

