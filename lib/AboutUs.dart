// ignore: file_names
import 'package:flutter/material.dart';
import 'Banner.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_redirect/store_redirect.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 106, 62, 0.906),
      body: DecoratedBox(
              decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background/berana.png"), fit: BoxFit.cover),
      ),
        child: Column(
          children: [
             Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 5),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.brown.shade900,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dire_Dawa',
                  ),
                  textAlign: TextAlign.center,
                  child: Text('About Us'),
                ),
              ),
            ),
           Padding(
              padding: EdgeInsets.fromLTRB(12, 5, 10, 10),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.brown.shade900,
                  fontFamily: 'Dire_Dawa',
                ),
                textAlign: TextAlign.center,
                child: Text(
                    'Dima Creative is a mobile app development company located in Addis Ababa, Ethiopia. Our team of skilled developers creates innovative solutions for businesses and individuals using cutting-edge technology. and aim to provide the best service to our users.'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.brown.shade900,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.center,
                    child: Text('Version'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.brown.shade900,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.end,
                    child: Text('UI/UX Designer'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 10),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.brown.shade900,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.center,
                    child: Text('0.1'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.brown.shade900,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.center,
                    child: Text('@BINYADENEW'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.brown.shade900,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.center,
                    child: Text('Address'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.brown.shade900,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.end,
                    child: Text('Contact'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 10),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.brown.shade900,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.start,
                    child: Text('Ethiopia \nAddis Ababa'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 10),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.brown.shade900,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.end,
                    child: Text('+251 903 431 640 \n dimacreative63@gmail.com'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 10, 0, 0),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.brown.shade900,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.center,
                    child: Text('Programmer'),
                  ),
                ),
              ],
            ),
            Row(
              children:  [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 10, 5),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.brown.shade900,
                      fontFamily: 'Dire_Dawa',
                    ),
                    textAlign: TextAlign.start,
                    child: Text('Michael Demeke \nmichaeldemekeal@gmail.com'),
                  ),
                )
              ],
            ),
          Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 5),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 29,
                    color: Colors.brown.shade900,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dire_Dawa',
                  ),
                  textAlign: TextAlign.center,
                  child: Text('Rate Us'),
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: 2,
              minRating: 1,
              itemSize: 60,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              // ignore: prefer_const_constructors
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
                size: 100.0,
              ),
              onRatingUpdate: (rating) {
                StoreRedirect.redirect(androidAppId: "com.Begena.Simulation");
                print(rating);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 45, 0, 20),
                height: 100,
                width: 80,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/background/dima.png'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: BottomBanner(),
            ),
          ],
        ),
      ),
    );
  }
}
