import 'package:flutter/material.dart';
import 'constants/theme.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/authentication _screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NoComms());
}


class NoComms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        AuthenticationScreen.id: (context) => AuthenticationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
