import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_flutter_app/screens/chat_screen.dart';
import 'package:flash_chat_flutter_app/screens/login_screen.dart';
import 'package:flash_chat_flutter_app/screens/registration_screen.dart';
import 'package:flash_chat_flutter_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black54)),
      // ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
