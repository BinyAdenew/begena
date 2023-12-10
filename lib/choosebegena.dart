import 'package:begena/Tones.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'
    show
        AdRequest,
        FullScreenContentCallback,
        InterstitialAd,
        InterstitialAdLoadCallback;

import 'Banner.dart';
import 'ColorStrings.dart';
import 'MainMenu.dart';
import 'animationkerar.dart';
import 'Tones.dart';
import 'constant.dart';

class choosebegena extends StatefulWidget {
  final int i;
  const choosebegena({super.key, required this.i});

  @override
  State<choosebegena> createState() => _choosebegenaState();
}

class _choosebegenaState extends State<choosebegena> {
  int activeIndex = 0;
  InterstitialAd? interstitialAd;
  int interstitialAttempts = 0;
  int maxAttempts = 3;

  static const AdRequest request = AdRequest();
  final imagekerar = [
    "assets/chooseBegena/1.png",
    "assets/chooseBegena/2.png",
    "assets/chooseBegena/3.png"
  ];
  late int i;
  void createInterstailAd() {
    InterstitialAd.load(
        //   adUnitId: 'ca-app-pub-9637796854099334/4711818315',
        //adUnitId: 'ca-app-pub-9637796854099334/4711818315',
        adUnitId: 'ca-app-pub-9637796854099334/5346735683',
        // adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            interstitialAttempts = 0;
          },
          onAdFailedToLoad: (error) {
            interstitialAttempts++;
            interstitialAd = null;
            print('Faild to load ${error.message}');

            if (interstitialAttempts <= maxAttempts) {
              createInterstailAd();
            }
          },
        ));
  }

  void showInterstitialAd(int index) {
    if (interstitialAd == null) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => animationKerar(
                  index: i,
                  i: 1,
                  num: n(),
                  string: mm(),
                )),
      );
      print('trying to show before loading');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) => print('ad showed $ad'),
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        createInterstailAd();

        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => animationKerar(
                    index: index,
                    i: 1,
                    num: n(),
                    string: mm(),
                  )),
        );
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        print('failed to show the as $ad');

        createInterstailAd();

        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => animationKerar(
                    index: index,
                    i: 1,
                    num: n(),
                    string: mm(),
                  )),
        );
      },
    );
    interstitialAd!.show();
    interstitialAd = null;
  }

  @override
  void initState() {
    createInterstailAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.i == 0) {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MainMenu()),
          );
        }
        return true;
      },
      child: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/home.jpg"),
                fit: BoxFit.cover),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 43,
                      color: Colors.brown.shade900,
                      fontFamily: 'Dire_Dawa',
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("በገና ምረጥ")),
              ),
              CarouselSlider.builder(
                  itemCount: imagekerar.length,
                  itemBuilder: (context, index, reallndex) {
                    final kerar = imagekerar[index];
                    return buildimage(kerar, index);
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.70, //600
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  )),
              const SizedBox(height: 12),
              buildIndictor(),
              SizedBox(
                height: 50,
              ),
              BottomBanner(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildimage(String kerar, int index) => GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90, //
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Image.asset(
            kerar,
            fit: BoxFit.contain,
          ),
        ),
        onTapDown: (_) {
          showInterstitialAd(index);
          i = index;
          kerarsave(index);
          //   Navigator.of(context).push(
          //   MaterialPageRoute(
          //       builder: (context) => animationKerar(index: i,i: 1,
          //     )),
          // );
        },
      );

  Widget buildIndictor() => AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(
          dotWidth: 15, activeDotColor: Colors.orange, dotColor: Colors.black),
      activeIndex: activeIndex,
      count: imagekerar.length);
}
