
import 'package:flutter/material.dart';
import 'package:giftlink/app_properties.dart';

import 'register_page.dart';

class  WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  TextEditingController email =
  TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget welcomeBack = Text(
      'Welcome Offer App,',
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

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 0.0),
        child: Text(
          'Login to your account using\nMobile number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      right: MediaQuery.of(context).size.width / 4,

      bottom: 40,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => RegisterPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 60,
          child: Center(
              child: new Text("Log In",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
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

    Widget loginForm = Container(
      height: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width/1.1,
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight:Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TextField(
                    controller: email,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      filled: true,fillColor: Colors.transparent,
                      hintText: "Enter Your Mobile Number",
                      // labelStyle: TextStyle(color: Colors.black,backgroundColor: Colors.yellow),

                      //can also add icon to the end of the textfiled
                      //  suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),

              ],
            ),
          ),
          loginButton,
        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Forgot your password? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Reset password',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );

    return


      Scaffold(

          body:Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/back.png'),
                    fit: BoxFit.fill )
            ),child:  ListView(shrinkWrap: true,
            children: <Widget>[
              Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Spacer(flex: 3),
                      Padding(padding: EdgeInsets.fromLTRB(0, 70, 0, 10),child:  welcomeBack,),
                      // Spacer(),
                      Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 10),child:   subTitle,),
                      // Spacer(flex: 2),
                      Padding(padding: EdgeInsets.fromLTRB(0, 90, 25, 10),child: Column(children: <Widget>[loginForm,
                      ],)),
                      // Spacer(flex: 2),
                      Column(children: <Widget>[Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 10),
                        child: forgotPassword,)],)
                      ,
                      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: GestureDetector(
                          onTap: (){

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return showDialogwindowDone();
                                });
                          },child:
                        Row(children: <Widget>[
                          Text('Read Privacy Ploice',style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white),)
                        ],        mainAxisAlignment: MainAxisAlignment.center,
                        )


                          ,),),
                    ],
                  ),
                )
              ],)],),)
      );
  }

  Widget showDialogwindowDone() {
    return new AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/backalert.jpg'))),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Text(
                          'Credential',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text('This application offers you all kinds of offers and discounts available anywhere in exchange for a simple monthly subscription',style: TextStyle(color: Colors.black),),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
                      child: new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();



                            //    _buildSubmitFormCo(context, wareId, offerId, dateD);
                          }
                          //  textColor: Colors.yellow,colorBrightness: Brightness.dark,
                          ,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          color: Colors.lightGreen,
                          child: Center(
                            child: new Text(
                              'Ok',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

  }


}
