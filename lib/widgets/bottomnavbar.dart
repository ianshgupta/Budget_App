import 'package:budget_app/screens/Myprofile.dart';
import 'package:budget_app/screens/addscreen.dart';
import 'package:budget_app/screens/home.dart';
import 'package:budget_app/screens/statistics.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class nav extends StatefulWidget {

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  GlobalKey<CurvedNavigationBarState> _NavKey=GlobalKey();
  var PagesAll=[Home(),Statistics(),Add(),ProfilePage()];
  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("UBudget"),
        backgroundColor: Colors.pinkAccent,

      ),

      bottomNavigationBar:Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.black)
        ),

      child: CurvedNavigationBar(
        key: _NavKey,
         backgroundColor: Colors.transparent,
          items: [
            Icon((myindex==0)?Icons.home_outlined:Icons.home, size: 30,),
            Icon((myindex==1)?Icons.auto_graph_outlined:Icons.auto_graph, size: 30,),
            Icon((myindex==2)?Icons.add_box_outlined:Icons.add, size: 30,),
            Icon((myindex==3)?Icons.people_outlined:Icons.people, size: 30,),
          ],
          buttonBackgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
          animationCurve: Curves.fastLinearToSlowEaseIn,color: Colors.pinkAccent,
      )),
      body: PagesAll[myindex],
    );
  }
}

