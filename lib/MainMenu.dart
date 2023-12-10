// ignore: file_names
import 'choosebegena.dart';
import 'package:flutter/material.dart';
import 'Banner.dart';
import 'AboutUs.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Training.dart';
import 'listviewaudio.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late double   widt = MediaQuery.of(context).size.width * 0.60; //230
  late double   heigh = MediaQuery.of(context).size.height * 0.11; //90
  late Directory appDirectory;
  List<String> records = [];

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
  //  super.initState();

    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        if (onData.path.contains('.aac')) records.add(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
      });
    });
     super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/home.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                      width: MediaQuery.of(context).size.width * 0.28, // 700
                    height: MediaQuery.of(context).size.height * 0.18,
                      decoration: const BoxDecoration(
                       image: DecorationImage(
                      image: AssetImage("assets/background/icone.png"), fit: BoxFit.cover),
          ),
                  ),
    //Option 1
    
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Container(
                          width: widt,
                          height: heigh,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/background/button.png"),
                                fit: BoxFit.fill),
                          ),
                          child: const Center(
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  fontFamily: 'Dire_Dawa',
                                  fontSize: 35,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              child: Text('በገና መጫወት'),
                            ),
                          
                          ),
                        ),
                        onTap: () {
                          //Navigator.pop(context); //pop dialog
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const choosebegena(
                                      i: 1,
                                    )),
                          );
                        }),
                  ),
    
    //Option 2
    
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Container(
                            width: widt,
                            height: heigh,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/background/button.png"),
                                  fit: BoxFit.fill),
                            ),
                            child: const Center(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    fontFamily: 'Dire_Dawa',
                                    fontSize: 35,
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                child: Text('የተቀመጠ ሙዚቃ'),
                              ),
                            )),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ListViewRecord()));
                        }),
                  ),
    
    //Option 3
    
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Container(
                            width: widt,
                            height: heigh,
                            // ignore: prefer_const_constructors
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/background/button.png"),
                                  fit: BoxFit.fill),
                            ),
                            child: const Center(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    fontFamily: 'Dire_Dawa',
                                    fontSize: 35,
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                child: Text('አጋዥ ስልጠና'),
                              ),
                            )),
                        onTap: () {
                          // Navigator.pop(context); //pop dialog
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Training()),
                          );
                        }),
                  ),
    
          // Option 4
          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Container(
                            width: widt,
                            height: heigh,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/background/button.png"),
                                  fit: BoxFit.fill),
                            ),
                            child: const Center(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    fontFamily: 'Dire_Dawa',
                                    fontSize: 35,
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                child: Text('ስለ እኛ'),
                              ),
                            )),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()),
                          );
                        }),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 140, 0, 0),
               child: BottomBanner(),
              ),
            ],
          )),
    );
  }
}
