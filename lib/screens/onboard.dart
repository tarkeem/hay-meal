import 'package:flutter/material.dart';
import 'package:hay_meals/widgets/pageViewWid.dart';

class onboard extends StatefulWidget {
  static final rout_name = 'onboard';
  const onboard({super.key});

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  int curPag = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [first(context), second(), third()],
          )
        ],
      ),
    );
  }
}
