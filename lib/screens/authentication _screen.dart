import 'package:flutter/material.dart';
import '../components/login_buttons.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AuthenticationScreen extends StatefulWidget {
  static String id = "AuthenticationScreen";
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool loader = false;

  void showSnackbar(String str){
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Error',
        message: str,
        color: Theme.of(context).colorScheme.primary,
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void preAuth(){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    setState(() {
      loader = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loader,
        child: Padding(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  LoginButton(
                    buttonTitle: "Register",
                    onPressed: () async {
                      preAuth();
                      try{
                        final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        ).timeout(const Duration(seconds: 2));
                        if(newUser != null){
                          setState(() {
                            loader = false;
                          });
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      }
                      on FirebaseAuthException catch (e){
                        setState(() {
                          loader = false;
                        });
                        showSnackbar(e.message.toString());
                      }
                      catch(e){
                        showSnackbar(e.toString());
                      }
                    },
                  ),
                  LoginButton(
                    buttonTitle: "Log In",
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      setState(() {
                        loader = true;
                      });
                      try{
                        final user = await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        if(user != null){
                          setState(() {
                            loader = false;
                          });
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      }
                      on FirebaseAuthException catch (e){
                        setState(() {
                          loader = false;
                        });
                        showSnackbar(e.message.toString());
                      }
                      catch(e){
                        showSnackbar(e.toString());
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
