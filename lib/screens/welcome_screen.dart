import 'package:flutter/material.dart';
import '../components/login_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/authentication _screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    // animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo-img',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: controller.value * 55,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                DefaultTextStyle(
                  style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('NoComms')
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // LoginButton(
            //   buttonTitle: "Log In",
            //   onPressed: (){
            //     Navigator.pushNamed(context, LoginScreen.id);
            //   },
            // ),
            LoginButton(
              buttonTitle: "Get Started",
              onPressed: (){
                Navigator.pushNamed(context, AuthenticationScreen.id);
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('Yay! A SnackBar!'),
                //     ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
