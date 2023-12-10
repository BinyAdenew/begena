import 'dart:core';
import 'package:begena/constant.dart';

import 'Banner.dart';
import 'choosebegena.dart';
import 'package:flutter/material.dart';
//import 'Banner';
import 'package:rive/rive.dart';
import 'ColorStrings.dart';
import 'Tones.dart';
import 'TopMenu.dart';
import 'dart:math';

// ignore: camel_case_types
class animationKerar extends StatefulWidget {
  final int index;
  final int i;
  final String string;
  final int num;
  const animationKerar({Key? key, required this.index, required this.i, required this.string, required this.num})
      : super(key: key);

  @override
  State<animationKerar> createState() => _animationKerarState();
}

// ignore: camel_case_types
class _animationKerarState extends State<animationKerar> {
  late RiveAnimationController _stringOneController;
  late RiveAnimationController _stringTwoController;
  late RiveAnimationController _stringThreeController;
  late RiveAnimationController _stringFourController;
  late RiveAnimationController _stringFiveController;
  String text = '';
  double widt = 20;
  double heigh = 950;
  late double space = MediaQuery.of(context).size.width * 0.05;
  String begena= "assets/rive/begena.riv";
  late int current;
  late String npw;
  //int num = 0;
  late String kerarstring ;

  @override
  void initState() {
    setState(() {
          current =  n();
    kerarstring = initkerar();
    });

    if (widget.index == 0) {
     begena = "assets/Begena image/2.png";
    } else if (widget.index == 1) {
     begena = "assets/Begena image/1.png";
    } else if (widget.index == 2) {
      begena = "assets/Begena image/3.png";
    } 
    super.initState;
    _stringOneController = OneShotAnimation(
      'playing',
      autoplay: false,
    );
    _stringTwoController = OneShotAnimation(
      'playing',
      autoplay: false,
    );
    _stringThreeController = OneShotAnimation(
      'playing',
      autoplay: false,
    );
    _stringFourController = OneShotAnimation(
      'playing',
      autoplay: false,
    );
    _stringFiveController = OneShotAnimation(
      'playing',
      autoplay: false,
    );
    setState(() {
      npw = widget.string;
    });
    print("string work $npw");

  }
     List<bool> stringStates = [false, false, false, false, false]; 
  @override
  void dispose() {
    super.dispose();
  }


 void trigger(int i){
    if(i==0  && stringStates[i]){
      setState(() {
         _playTrackChangeAnimation(_stringOneController);
                   try {
                      String1();
                    } catch (e) {
                        setState(() {
                         text = e.toString();
                     });
           }
      });

    }
    else if (i==1  && stringStates[i]){
      setState(() {
          _playTrackChangeAnimation(_stringTwoController);
                  try {
                    String2();
                  } catch (e) {
                  setState(() {
                      text = e.toString();
                  });
           }
      });

    }
    else if (i==2  && stringStates[i]){
        setState(() {
          _playTrackChangeAnimation(_stringThreeController);
               try {
                  String3();
                } catch (e) {
                setState(() {
                    text = e.toString();
                 });
             }
        });
    }
    else if (i==3  && stringStates[i]){
      setState(() {
            _playTrackChangeAnimation(_stringFourController);
                try {
                  String4();
                } catch (e) {
                     setState(() {
                  text = e.toString();
                });
            }
      });
    }
    else if (i==4  && stringStates[i]){
      setState(() {
               _playTrackChangeAnimation(_stringFiveController);
                try {
                  String5();
                } catch (e) {
                     setState(() {
                  text = e.toString();
                });
            }
      });
   
    }
  }


  void _playTrackChangeAnimation(RiveAnimationController controller) {
    if (controller.isActive == false) {
      controller.isActive = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    widt - MediaQuery.of(context).size.width * 0.5;
    heigh = MediaQuery.of(context).size.height; //425
    return WillPopScope(
      /// todo: close search widget
      //Navigator.pop(context);
      onWillPop: () async {
        if (widget.i == 0) {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const choosebegena(
                      i: 0,
                    )),
          );
        }
        return true;
      },
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/home.jpg"),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 25, 5, 0),
                    child: TopMenu(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: 
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.85, // 680
                                width: MediaQuery.of(context).size.width, // 700
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(begena),
                                  fit: BoxFit.cover,
                                )),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                                    child: GestureDetector(
                                      onPanUpdate: (details) {
                                        setState(() {
                                          double screenWidth = MediaQuery.of(context).size.width;
                                           double screenHeight = MediaQuery.of(context).size.height;

                                          for (int i = 0; i < stringStates.length; i++) {
                                            double stringPosition = (screenWidth / (stringStates.length + 1)) * (i + 1);
                                            if (details.globalPosition.dx >= stringPosition - screenWidth / 10 &&
                                                details.globalPosition.dx <= stringPosition + screenWidth / 10) {
                                              // Trigger the string if figure is within a certain range of the string position
                                              stringStates[i] = true;
                                              trigger(i);
                                            } else {
                                              // Reset other strings if figure is not within range
                                              stringStates[i] = false;
                                            }
                                            }
                                        });
                                      },
                                      child: SizedBox(
                                        width: 600,
                                        height: heigh,
                                        child: Padding(
                                          padding:  EdgeInsets.fromLTRB(0, 35, 0, 0),
                                          child: Container(
                                            
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                //String 1
                                          
                                                Padding(
                                                  padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                                                  child: Transform.rotate(
                                                    angle: 0* pi / 180,
                                                    child: GestureDetector(
                                                      onTapDown: (_) async {
                                                        _playTrackChangeAnimation(
                                                            _stringOneController);
                                                        try {
                                                          String1();
                                                        } catch (e) {
                                                          setState(() {
                                                            text = e.toString();
                                                          });
                                                        }
                                                      },
                                                      child: SizedBox(
                                                        width: widt,
                                                        height: heigh,
                                                        child: RiveAnimation.asset(
                                                          npw,
                                                          controllers: [
                                                            _stringOneController,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          
                                                // String 2
                                          
                                                Padding(
                                                  padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                                                  child: Transform.rotate(
                                                    angle: 0 * pi / 180,
                                                    child: GestureDetector(
                                                      onTapDown: (_) async {
                                                        _playTrackChangeAnimation(
                                                            _stringTwoController);
                                                        try {
                                                          String2();
                                                        } catch (e) {
                                                          setState(() {
                                                            text = e.toString();
                                                          });
                                                        }
                                                      },
                                                      child: SizedBox(
                                                        width: widt,
                                                        height: heigh,
                                                        child: RiveAnimation.asset(
                                                          widget.string,
                                                          controllers: [
                                                            _stringTwoController,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          
                                          // String 3
                                          
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                                  child: Transform.rotate(
                                                    angle: 0 * pi / 180,
                                                    child: GestureDetector(
                                                      onTapDown: (_) async {
                                                        _playTrackChangeAnimation(
                                                            _stringThreeController);
                                                        try {
                                                          String3();
                                                        } catch (e) {
                                                          setState(() {
                                                            text = e.toString();
                                                          });
                                                        }
                                                      },
                                                      child: SizedBox(
                                                        width: widt,
                                                        height: heigh,
                                                        child: RiveAnimation.asset(
                                                          widget.string,
                                                          controllers: [
                                                            _stringThreeController,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          
                                                //String 4
                                          
                                                Padding(
                                                  padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                                                  child: Transform.rotate(
                                                    angle: 0 * pi / 180,
                                                    child: GestureDetector(
                                                      onTapDown: (_) async {
                                                        _playTrackChangeAnimation(
                                                            _stringFourController);
                                                        try {
                                                          String4();
                                                        } catch (e) {
                                                          setState(() {
                                                            text = e.toString();
                                                          });
                                                        }
                                                      },
                                                      child: SizedBox(
                                                        width: widt,
                                                        height: heigh,
                                                        child: RiveAnimation.asset(
                                                          widget.string,
                                                          controllers: [
                                                            _stringFourController,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          
                                                // String 5
                                          
                                                Padding(
                                                  padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                                                  child: Transform.rotate(
                                                    angle: 0 * pi / 180,
                                                    child: GestureDetector(
                                                      onTapDown: (_) async {
                                                        _playTrackChangeAnimation(
                                                            _stringFiveController);
                                                        try {
                                                          String5();
                                                        } catch (e) {
                                                          setState(() {
                                                            text = e.toString();
                                                          });
                                                        }
                                                      },
                                                      child: SizedBox(
                                                        width: widt,
                                                        height: heigh,
                                                        child: RiveAnimation.asset(
                                                          widget.string,
                                                          controllers: [
                                                            _stringFiveController,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                                          Container(
                                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.79),
                                          child: BottomBanner()),
                            ],
                          ),
                          // for(int i =0 ; i < 4; i++)
   
                 
                    ),
                  ),
  
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.75,
                //   height:  MediaQuery.of(context).size.height * 0.05,
                //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   decoration: BoxDecoration(
                //     color: Colors.brown[700]
                //   ),
                // )
                ],
              ),
                          Center(
                             child: Container(
                              margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.72),
                               child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                     child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontFamily: 'Dire_Dawa',
                                                fontSize: 30,
                                                color: Colors.brown,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                             
                                            child: Text(stringname[n()][0]),
                                          ),
                                   ),
                                 Padding(
                                     padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                                     child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontFamily: 'Dire_Dawa',
                                                fontSize: 30,
                                                color: Colors.brown,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                            child: Text(stringname[widget.num][1]),
                                          ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                                     child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontFamily: 'Dire_Dawa',
                                                fontSize: 30,
                                                color: Colors.brown,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                            child: Text(stringname[widget.num][2]),
                                          ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                                     child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontFamily: 'Dire_Dawa',
                                                fontSize: 30,
                                                color: Colors.brown,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                            child: Text(stringname[widget.num][3]),
                                          ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                                     child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontFamily: 'Dire_Dawa',
                                                fontSize: 30,
                                                color: Colors.brown,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                            child: 
                                            Text(stringname[widget.num][4]),
                                          ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
            ],
          ),
        ),
      ),
    );
  }
}
