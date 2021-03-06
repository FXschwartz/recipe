import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 50.0,
      items: <Widget>[
        Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.list,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.compare_arrows,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.call_split,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.perm_identity,
          size: 30,
          color: Colors.white,
        ),
      ],
      color: Colors.lightBlueAccent,
      buttonBackgroundColor: Colors.lightBlueAccent,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }
}
