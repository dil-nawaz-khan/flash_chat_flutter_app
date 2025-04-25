import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter_app/components/rounded_button.dart';
import 'package:flash_chat_flutter_app/constants.dart';
import 'package:flash_chat_flutter_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(
          builder:
              (context) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: SizedBox(
                          height: 200.0,
                          child: Image.asset('images/logo.png'),
                        ),
                      ),
                    ),
                    SizedBox(height: 48.0),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password',
                      ),
                    ),
                    SizedBox(height: 24.0),
                    RoundedButton(
                      color: Colors.blueAccent,
                      title: 'Register',
                      onPressed: () async {
                        final progress = ProgressHUD.of(context);
                        progress?.show();
                        try {
                          final newUser = await _auth
                              .createUserWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                          if (newUser != null) {
                            Navigator.pushNamed(context, ChatScreen.id);
                          }
                          progress?.dismiss();
                        } catch (e) {
                          print(e);
                          progress?.dismiss();
                        }
                      },
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
