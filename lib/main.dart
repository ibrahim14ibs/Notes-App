import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/app/about_page.dart';
import 'package:notes/constants/constants.dart';
import 'package:notes/constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/auth/login.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: theme(),
      darkTheme: themeDark(),
      home: prefs.getString("id") == null ? Login() : App(),
    );
  }
}
