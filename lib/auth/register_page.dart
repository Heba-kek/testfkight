
import 'package:flutter/material.dart';
import 'package:giftlink/app_properties.dart';
import 'package:giftlink/auth/info.dart';
import 'package:giftlink/wallet/wallet_page.dart';

import 'forgot_password_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController code =
      TextEditingController();




  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Verfication Account',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );



    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      right: MediaQuery.of(context).size.width / 4,
      bottom:100,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Info()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 60,
          child: Center(
              child: new Text("Register",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: mainButton,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget registerForm = Container(
      height: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width/1.1,
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                topRight:  Radius.circular(10),
                bottomRight:  Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: code,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      filled: true,fillColor: Colors.transparent,
                      hintText: "Enter Your Code",
                      // labelStyle: TextStyle(color: Colors.black,backgroundColor: Colors.yellow),

                      //can also add icon to the end of the textfiled
                      //  suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),

              ],
            ),
          ),
          registerButton,
        ],
      ),
    );



    return Scaffold(

              body: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/back.png'),
                            fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: transparentYellow,

                    ),
                  ),


 ListView(children: <Widget>[    Padding(
   padding: const EdgeInsets.only(left: 28.0),
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.start,
     children: <Widget>[
       //  Spacer(flex:3),
       Padding(padding: EdgeInsets.fromLTRB(0, 140, 0, 10),child:   title),

       //Spacer(flex:2),

       Padding(padding: EdgeInsets.fromLTRB(0, 90, 25, 10),child:        registerForm),
       //Spacer(flex:2),

     ],
   ),
 ),],shrinkWrap: true,),


                  Positioned(
                    top: 35,
                    left: 5,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            );
  }
}
