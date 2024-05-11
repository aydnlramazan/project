import 'package:flutter/material.dart';
import '../animation/console_animation.dart';
import '../main.dart';

class DecryptScreen extends StatefulWidget {
  @override
  _DecryptScreenState createState() => _DecryptScreenState();
}

class _DecryptScreenState extends State<DecryptScreen> {
  bool _showContinue = false;

  @override
  Widget build(BuildContext context) {
    final int nextLevel = ModalRoute.of(context)!.settings.arguments as int;

    Main.currentLevel = nextLevel;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: getContent(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: _showContinue
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/level$nextLevel');
                            },
                            child: Image.asset(
                              'assets/images/intro_button_continue.png',
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getText() {
    switch (Main.currentLevel) {
      case 2:
        return "Great! You have now intercepted the messages sent by NDI. "
            "But they seem to be encrypted, as expected. "
            "Luckily, this isn't anything you cannot deal with...";
      case 3:
      default:
        return "DECRYPTING MESSAGE...\n"
            "-- START OF MESSAGE --\n"
            "The first prototypes for the new Super Pollutant Power Plant™ are ready to start the tests.\n"
            "If they are successful, the plan to replace 5000 wind mills with these new oil-fired power plants will go ahead.\n"
            "-- END OF MESSAGE --";
    }
  }

  Widget getContent() {
    return ConsoleAnimatedTextKit(
      displayFullTextOnTap: true,
      text: getText().split('\n'),
      onFinished: () => setState(() {
        _showContinue = true;
      }),
      textStyle: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Rajdhani',
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
      alignment: Alignment.topCenter,
    );
  }
}
