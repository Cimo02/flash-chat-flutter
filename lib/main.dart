import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.route,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        WelcomeScreen.route: (context) => WelcomeScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        ChatScreen.route: (context) => ChatScreen(),
        RegistrationScreen.route: (context) => RegistrationScreen(),
      },
    );
  }
}
