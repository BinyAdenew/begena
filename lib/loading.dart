import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//import 'MainMenu';
import 'MainMenu.dart';
//import 'animationkerar.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });

    controller.repeat();

    Future.delayed(const Duration(seconds: 5), () {
      WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
      Navigator.pop(context); //pop dialog
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => 
           MainMenu(),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background/Begena guy.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          //   SizedBox(
          //     height: MediaQuery.of(context).size.height * 0.01,
          //   ),
            // Container(
            //   //padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
            //   height: MediaQuery.of(context).size.height * 0.38,// 300
            //   width: MediaQuery.of(context).size.width * 0.62,// 300
            //   decoration: const BoxDecoration(
            //       image: DecorationImage(
            //     image: AssetImage('assets/background/kerarguy.png'),
            //     fit: BoxFit.cover,
            //   )),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.12,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                height: MediaQuery.of(context).size.height * 0.15, // 110
                width: MediaQuery.of(context).size.width * 0.29, //100
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/background/dima.png'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
             DefaultTextStyle(
                              style: TextStyle(fontSize: 15, color: Colors.brown.shade900),
                              textAlign: TextAlign.center,
                              child: Text('Begena SIMULATION'),
                            ),
                          
              DefaultTextStyle(
                              style: TextStyle(fontSize: 15, color: Colors.brown.shade900),
                              textAlign: TextAlign.center,
                              child: Text('ETHIOPIAN Stringed Insturment'),
                            ),                
      
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Container(
                padding: const EdgeInsets.all(32),
                child: LinearProgressIndicator(
                  minHeight: 8,
      
                  backgroundColor: Colors.black,
                    value: animation.value,
                    color: const Color.fromARGB(255, 199, 54, 69)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
