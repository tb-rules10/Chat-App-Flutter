import 'package:flutter/material.dart';
import '../components/login_buttons.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static String id = "RegistrationScreen";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              buttonTitle: "Register",
              onPressed: () async {
                print(email);
                print(password);
                try{
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if(newUser != null){
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
