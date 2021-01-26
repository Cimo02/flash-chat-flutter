import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//Add "with SingleTickerProviderStateMixin"
// to state to use a ticker for animations
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();
    // this is where you would use the animation value
    controller.addListener(() {
      // setState doesn't need to contain anything, addListener updates value for you
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 200),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 36.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonText: 'Log In',
              buttonColor: Colors.lightBlueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.route);
              },
            ),
            RoundedButton(
              buttonText: 'Register',
              buttonColor: Colors.blueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, RegistrationScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
