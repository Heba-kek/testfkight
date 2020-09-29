
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftlink/app_properties.dart';
import 'package:giftlink/categorayPage.dart';
import 'package:giftlink/wallet/wallet_page.dart';

import 'forgot_password_page.dart';

class Info extends StatefulWidget {
  @override
  _info createState() => _info();
}

class _info extends State<Info> {
  TextEditingController code =
  TextEditingController();
  TextEditingController name =
  TextEditingController();
  TextEditingController email =
  TextEditingController();
  TextEditingController enname =
  TextEditingController();
  TextEditingController pass =
  TextEditingController();
  TextEditingController mobile =
  TextEditingController();
  TextEditingController facelink =
  TextEditingController();




  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Your Information',
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

     // bottom: 200,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => catPAge()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 60,
          child: Center(
              child: new Text("Done",
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

    Widget registerForm =  Container(
      //   height: 200,
      child: Stack(
        children: <Widget>[
          ListView(children: <Widget>[ Container(
            //  height: 100,
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: name,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      filled: true,fillColor: Colors.transparent,
                      hintText: "Enter Your Name",
                      // labelStyle: TextStyle(color: Colors.black,backgroundColor: Colors.yellow),

                      //can also add icon to the end of the textfiled
                      //  suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: enname,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      filled: true,fillColor: Colors.transparent,
                      hintText: "Enter Your English Name",
                      // labelStyle: TextStyle(color: Colors.black,backgroundColor: Colors.yellow),

                      //can also add icon to the end of the textfiled
                      //  suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: email,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      filled: true,fillColor: Colors.transparent,
                      hintText: "Enter Your Email",
                      // labelStyle: TextStyle(color: Colors.black,backgroundColor: Colors.yellow),

                      //can also add icon to the end of the textfiled
                      //  suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: pass,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      filled: true,fillColor: Colors.transparent,
                      hintText: "Enter Your Password",
                      // labelStyle: TextStyle(color: Colors.black,backgroundColor: Colors.yellow),

                      //can also add icon to the end of the textfiled
                      //  suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: mobile,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      filled: true,fillColor: Colors.transparent,
                      hintText: "Enter Your Mobile number",
                      // labelStyle: TextStyle(color: Colors.black,backgroundColor: Colors.yellow),

                      //can also add icon to the end of the textfiled
                      //  suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 8.0,bottom:30),
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

              Padding(padding:EdgeInsets.all(10),child:  InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => catPAge()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: Center(
                      child: new Text("Done",
                          style: const TextStyle(
                              color: const Color(0xfffefefe),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0))),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    //  gradient: mainButton,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 10, 0, 0.1),
                          offset: Offset(0, 5),
                          blurRadius: 10.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(9.0)),
                ),
              ))


              ],
            ),
          )],shrinkWrap: true,),

        ],
      ),
    );



    return Scaffold(

      body:ListView(shrinkWrap: true,
      children: <Widget>[ Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/back.png'),
                    fit: BoxFit.cover)
            ),
            child: Container(
              decoration: BoxDecoration(
                color: transparentYellow,

              ),
              child:    Padding(
                padding: const EdgeInsets.only(left: 2.0,top:100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Spacer(flex:1),

                    Padding(padding: EdgeInsets.all(25),child: title,),

                    Padding(padding: EdgeInsets.all(15),child: registerForm,),
                    //  Spacer(flex:2),

                  ],
                ),
              ),
            ),
          ),



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
      ),],)
    );
  }
}
