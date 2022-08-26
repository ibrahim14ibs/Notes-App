import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF5EAAA8);
const kAccentColor = Color(0xFFA3D2CA);
const kSecondaryColor = Color(0xFFEB5E0B);
const kSecondaryDark = Color(0xff1c1c1c);
const kScaffoldDark = Color(0xFF121212);
const kTextColor = Color(0xFF757575);
const kBorderColor = Color(0xFF757575);
const kGlobalOuterPadding = EdgeInsets.all(10.0);
const kGlobalCardPadding = EdgeInsets.all(5.0);
const kGlobalTextPadding =
    EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0);

const String linkServerName =
    "https://flutterapp14.000webhostapp.com/coursephp";
// Auth
const String linkSignUp = "$linkServerName/auth/signup.php";
const String linkLogin = "$linkServerName/auth/login.php";
// Note
const String linkViewNotes = "$linkServerName/notes/view.php";
const String linkAddNotes = "$linkServerName/notes/add.php";
const String linkEditNotes = "$linkServerName/notes/edit.php";
const String linkDeleteNotes = "$linkServerName/notes/delete.php";

const kAppName = 'Notes App';

const kVSpace = SizedBox(
  height: 15.0,
);
const kHSpace = SizedBox(
  width: 10.0,
);

const String messageInputEmpty = "This field can not be empty";
const String messageInputMin = "This field can not be less than";
const String messageInputMax = "This field can not be more than";
