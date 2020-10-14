import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int _page = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]); // Hides the Top bar
    SystemChrome.setPreferredOrientations([
      // Only vertical orientation
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ClipRRect(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        child: Scaffold(
          bottomNavigationBar: BottomNavBar(),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [FoodCatButtonBar()],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCatButtonBar extends StatefulWidget {
  @override
  _FoodCatButtonBarState createState() => _FoodCatButtonBarState();
}

class _FoodCatButtonBarState extends State<FoodCatButtonBar> {
  bool breakfastButtonActive = true;
  bool lunchButtonActive = false;
  bool dinnerButtonActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonBar(
          buttonTextTheme: ButtonTextTheme.normal,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color:
                        breakfastButtonActive ? Colors.lightBlue : Colors.white,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    dinnerButtonActive = false;
                    lunchButtonActive = false;
                    breakfastButtonActive = true;
                  });
                },
                child: Text(
                  'Breakfast',
                  style: TextStyle(
                    color:
                        breakfastButtonActive ? Colors.lightBlue : Colors.grey,
                    fontSize: breakfastButtonActive ? 15 : 13,
                  ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color:
                          lunchButtonActive ? Colors.lightBlue : Colors.white,
                    ),
                  ),
                ),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        lunchButtonActive = true;
                        breakfastButtonActive = false;
                        dinnerButtonActive = false;
                      });
                    },
                    child: Text(
                      'Lunch',
                      style: TextStyle(
                        color:
                            lunchButtonActive ? Colors.lightBlue : Colors.grey,
                        fontSize: lunchButtonActive ? 15 : 13,
                      ),
                    ))),
            Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color:
                          dinnerButtonActive ? Colors.lightBlue : Colors.white,
                    ),
                  ),
                ),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        dinnerButtonActive = true;
                        lunchButtonActive = false;
                        breakfastButtonActive = false;
                      });
                    },
                    child: Text(
                      'Dinner',
                      style: TextStyle(
                        color:
                            dinnerButtonActive ? Colors.lightBlue : Colors.grey,
                        fontSize: dinnerButtonActive ? 15 : 13,
                      ),
                    ))),
          ],
        ),
      ],
    );
  }
}
