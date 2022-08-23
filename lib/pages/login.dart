import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notes/common/constants.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/pages/signup.dart';

import '../crud.dart';
import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  Crud crud = Crud();

  bool isLoading = false;
  login() async {
    isLoading = true;
    setState(() {});
    var response = await crud.postRequest(linkLogin,
        {"email": _emailController.text, "password": _passwordController.text});
    isLoading = false;
    setState(() {});
    if (response['status'] == "success") {
      prefs.setString("id", response['data']['id'].toString());
      prefs.setString("username", response['data']['username']);
      prefs.setString("email", response['data']['email']);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return HomePage(title: "");
      }), (route) => false);
    } else {
      AwesomeDialog(
          context: context,
          title: "Alert",
          body: SizedBox(height: 50, child: Text('email or password wrong')))
        ..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: kGlobalOuterPadding,
        child: Container(
          padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Iconsax.password_check),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        await login();
                      }
                    },
                    child: Text('Sign-In')),
              ),
              Divider(
                thickness: 2,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SignUp();
                    }));
                  },
                  child: Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}
