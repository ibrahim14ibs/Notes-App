import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notes/common/constants.dart';
import 'package:notes/pages/app.dart';
import 'package:notes/pages/success.dart';

import '../crud.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  Crud _crud = Crud();

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  signUp() async {
    isLoading = true;
    setState(() {});
    var response = await _crud.postRequest(linkSignUp, {
      "username": _usernameController.text,
      "email": _emailController.text,
      "password": _passwordController.text
    });
    isLoading = false;
    setState(() {});
    if (response['status'] == "success") {
      print('success');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return Success();
          }), (route) => false);
    } else {
      print("SignUp Fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      extendBodyBehindAppBar: true,
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: kGlobalOuterPadding,
              child: Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: ListView(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _usernameController,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'UserName',
                        icon: Icon(Iconsax.user),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                            if (_usernameController.text.isNotEmpty &&
                                _emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              await signUp();
                            }
                          },
                          child: Text('Sign-Up')),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Sign In')),
                  ],
                ),
              ),
            ),
    );
  }
}
