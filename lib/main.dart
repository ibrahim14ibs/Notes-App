import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/common/constants.dart';
import 'package:notes/common/theme.dart';
import 'package:notes/pages/app.dart';
import 'package:notes/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
