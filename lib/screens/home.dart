import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 27, 32, 1),
      body: Column(
        children: [
          Column(
            children: [
              Center(
                  child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/animation_500_kmdnrdvl.gif'),
                  fit: BoxFit.contain,
                )),
              )),
            ],
          ),
          Container(
            width: 350,
            height: 70,
            padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
              color: Colors.pink,
              child: Text(" Logout",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          )
        ],
      ),
    );
  }
}
