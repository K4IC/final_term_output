import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "cictapps@wvsu.edu.ph";
  String pass = "toor";
  String animationType = "idle";

  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();

  final emailController = TextEditingController();
  final passFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    passFocusNode.addListener(() {
      if (passFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else {
        setState(() {
          animationType = "idle";
        });
      }
    });

    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else {
        setState(() {
          animationType = "idle";
        });
      }
    });

    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Incorrect email and/or password.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Try Again'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(13, 27, 42, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 200,
              ),

              Center(
                child: Container(
                    height: 300,
                    width: 300,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: new FlareActor(
                          "assets/teddy_test.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: animationType,
                        ),
                      ),
                      backgroundColor: Colors.white,
                    )),
              ),

              SizedBox(
                height: 50,
                width: 10,
              ),

              Container(
                height: 140,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          contentPadding: EdgeInsets.all(20)),
                      controller: emailController,
                      focusNode: emailFocusNode,
                    ),
                    Divider(),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          contentPadding: EdgeInsets.all(20)),
                      controller: passwordController,
                      focusNode: passFocusNode,
                    ),
                  ],
                ),
              ),

              Container(
                width: 350,
                height: 70,
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                    color: Colors.pink,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      if (passwordController.text.compareTo(pass) == 0 &&
                          emailController.text.compareTo(email) == 0) {
                        setState(() {
                          animationType = "success";
                          Navigator.pushNamed(context, '/home');
                        });
                      } else {
                        setState(() {
                          animationType = "fail";
                          _showMyDialog();
                        });
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
