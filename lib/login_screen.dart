import 'package:flutter/material.dart';
import 'package:googlesininSM/firebaseAuth.dart';
import 'package:googlesininSM/welcomeScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
             Container(
               
               child: RaisedButton(
                    child: Text("Google Login"),
                 onPressed: (){
                   signInWithGoogle().then((result) {
                     if(result !=null) {
                       Navigator.of(context).push(
                         MaterialPageRoute(
                           builder: (context) {
                             return FirstScreen();
                           },
                         ),
                       );
                     }
                   });
                 },
                 
               ),
               
             ),
             // _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

 // Widget _signInButton() {}
}