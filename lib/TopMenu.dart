// ignore: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'ColorStrings.dart';
import 'Recorder.dart';
import 'Tones.dart';
import 'animationkerar.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'constant.dart';
import 'listviewaudio.dart';

class TopMenu extends StatefulWidget {
  const TopMenu({super.key});

  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  double x = 90; // width
  double y = 50; // height
  List<String> items = [
   'Selamta',
    'Wane',
    'Selcherneth',
    'Ambasel',
    'Tizeta Minor',
    'Bati Major',
    'Bati Minor'
  ];
  late List<String> majors;
  String selectedItem = 'Selamta';
  String selectedItem2 = 'A1 Major';
  late Directory appDirectory;
  List<String> records = [];
  double currentvalue = 0.7;
  late double newvalue;
  String group = 'black';

  @override
  void initState() {
    group = assign();
    super.initState;
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        if (onData.path.contains('.aac')) records.add(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
        setState(() {});
      });
    });
    setState(() {
      selectedItem = getx();
      selectedItem2 = gety();
      majors = major;
      Tones2(selectedItem!, selectedItem2!);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    x = MediaQuery.of(context).size.width * 0.24;
    y = MediaQuery.of(context).size.height * 0.08;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Option 1
    
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: x,
                    height: y,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("assets/background/button.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: selectedItem,
                        dropdownColor: const Color.fromRGBO(221, 204, 188, 0.906),
                        iconSize: 0.0,
                        items: kignit
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Center(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: 'Dire_Dawa',
                                        color: Colors.brown.shade900,
                                        fontWeight: FontWeight.bold
                                        ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (item) => setState(() {
                 
                          selectedItem = item!;
                                   print ("selecteditem1 $selectedItem");
                          print("selecteditem2 $selectedItem2");
                          if(selectedItem == 'Bati Major'){
                            selectedItem2 = 'A1 Major';
                            yy(selectedItem2);
                            majors = batimajor;
                          }
                          else if(item == 'Bati Minor'){
                            selectedItem2 = 'A1 Major';
                            yy(selectedItem2);
                            majors = batiminor;
                          }
                          else{
                            selectedItem2 = 'A1 Major';
                            majors=major;
                          }
                          Tones2(selectedItem!, selectedItem2!);
                          xx(selectedItem!);
                                 Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      animationKerar(
                                                        index: showkerar(),
                                                        i: 0,
                                                        num: n(),
                                                        string: mm()
                                                      )),
                                              (Route<dynamic> route) => false,
                                              
                                            );
                        }),
                      ),
                    ))),
  
    
    //Option 2
    
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: x,
                    height: y,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("assets/background/button.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: selectedItem2,
                        dropdownColor: const Color.fromRGBO(221, 204, 188, 0.906),
                        // icon: const Icon(
                        //   Icons.music_note,
                        //   size: 7.0,
                        // ),
                        iconSize: 0.0,
                        items: majors
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Center(
                                  child: Text(
                                    item,
                                    style:  TextStyle(
                                        fontSize: 19,
                                        fontFamily: 'Dire_Dawa',
                                        color: Colors.brown.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (item) => setState(() {
                          selectedItem2 = item!;
                          Tones2(selectedItem!, selectedItem2!);
              
                          yy(selectedItem2!);
                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      animationKerar(
                                                        index: showkerar(),
                                                        i: 0,
                                                        num: n(),
                                                        string: mm()
                                                      )),
                                              (Route<dynamic> route) => false,
                                              
                                            );
                        }),
                      ),
                    ))),

    //Option 3
    
           Recorder(onSaved: _onRecordComplete),  
    
    //Option 4
    
            GestureDetector(
              onTapDown: (details) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          content: SizedBox(
                            width: 550,
                            height: 250,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/background/button.png"),
                                      fit: BoxFit.cover)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                                    child:  DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.brown.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Dire_Dawa',
                                        ),
                                        child: Text("Setting")),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.volume_down_sharp,
                                        size: 30,
                                      ),
                                      Slider(
                                          value: currentvalue,
                                          activeColor: const Color.fromARGB(
                                              255, 199, 54, 69),
                                          min: 0.0,
                                          max: 1.0,
                                          onChanged: (value) {
                                            setState(() {
                                              currentvalue = value;
                                              setvolum(currentvalue);
                                            });
                                          }),
                                    ],
                                  ),
                                   DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.brown.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Dire_Dawa',
                                      ),
                                      child: Text("String Color")),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Radio Button One
    
                                      Radio(
                                        value: 'black',
                                        groupValue: group,
                                        onChanged: (value) {
                                          setState(() {
                                            group = value!;
                                            stringschoose(group);
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      animationKerar(
                                                        index: showkerar(),
                                                        i: 0,
                                                        num: n(),
                                                        string: mm(),
                                                      )),
                                              (Route<dynamic> route) => false,
                                            );
                                
                                          });
                                        },
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: DefaultTextStyle(
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.black87,
                                              fontFamily: 'Dire_Dawa',
                                            ),
                                            child: Text("Black")),
                                      ),
    
    // Radio BUtton Two
    
                                      Radio(
                                        value: 'red',
                                        groupValue: group,
                                        onChanged: (value) {
                                          setState(() {
                                            group = value!;
                                            stringschoose(group);
                                             Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      animationKerar(
                                                        index: showkerar(),
                                                        i: 0,
                                                        num: n(),
                                                        string: mm()
                                                      )),
                                              (Route<dynamic> route) => false,
                                             );
                                          });
       
                                        },
                                      ),
                                       Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: DefaultTextStyle(
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.red.shade900,
                                              fontFamily: 'Dire_Dawa',
                                            ),
                                            child: Text("Red")),
                                      ),
    
    // Radio BUtton Three
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Radio(
                                        value: 'brown',
                                        groupValue: group,
                                        onChanged: (value) {
                                          setState(() {
                                            group = value!;
                                            stringschoose(group);
                                             Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      animationKerar(
                                                        index: showkerar(),
                                                        i: 0,
                                                        num: n(),
                                                        string: mm()
                                                      )),
                                              (Route<dynamic> route) => false,
                                            );
                                          });
                                        },
                                      ),
                                       Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: DefaultTextStyle(
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.brown.shade900,
                                              fontFamily: 'Dire_Dawa',
                                            ),
                                            child: Text("brown")),
                                      ),
    
    // Radio BUtton Four
    
                                      Radio(
                                        value: 'white',
                                        groupValue: group,
                                        onChanged: (value) {
                                          setState(() {
                                            group = value!;
                                            stringschoose(group);
                                             Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      animationKerar(
                                                        index: showkerar(),
                                                        i: 0,
                                                        num: n(),
                                                        string: mm()
                                                      )),
                                              (Route<dynamic> route) => false,
                                            );
                                          });
                                        },
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: DefaultTextStyle(
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontFamily: 'Dire_Dawa',
                                            ),
                                            child: Text("white")),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: Container(
                  width: x,
                  height: y,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage("assets/background/button.png"),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                    child: const Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }

  _onRecordComplete() {
    records.clear();
    appDirectory.list().listen((onData) {
      if (onData.path.contains('.aac')) records.add(onData.path);
    }).onDone(() {
      records.sort();
      records = records.reversed.toList();
      setState(() {});
    });
  }
}

class Counter with ChangeNotifier {
  int count = 1;

  void clickIncrease() {
    count += 1;
    notifyListeners();
  }
}
