import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hay_meals/screens/bottom_bar.dart';
import 'package:hay_meals/screens/cate_screen.dart';
import 'package:hay_meals/widgets/pageViewWid.dart';

class onboard extends StatefulWidget {
  static final rout_name = 'onboard';
  const onboard({super.key});

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  PageController _pageController=PageController();
   int curPag = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if(curPag<3)
      {
 _pageController.animateToPage(curPag, duration:Duration(milliseconds: 800) , curve: Curves.decelerate);
      curPag++;
      }
      else
      {
        curPag=0;
      }
     

     });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              children: [first(context), second(), third()],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(opacity: animation,child: bottom_bar(),);
                },));
                
              },
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Center(child: Text('start now',style: TextStyle(color: Colors.black,fontSize: 25),)),
              ),
            ))
        ],
      ),
    );
  }
}
