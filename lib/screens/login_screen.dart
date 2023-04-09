import 'package:flash_chat/components/login_buttons.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo-img',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            LoginInput(
              hintText: "Email",
              onChanged: (value){
                email = value;
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            LoginInput(
              obscureText: true,
              hintText: "Password",
              onChanged: (value){
                password = value;
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            LoginButton(
              buttonTitle: "Log In",
              onPressed: () async {
                try{
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                  );
                  if(user != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                }
                catch(e){
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
