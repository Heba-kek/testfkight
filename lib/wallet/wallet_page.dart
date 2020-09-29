import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giftlink/app_properties.dart';
import 'package:giftlink/main_page.dart';
import 'package:giftlink/product_page.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TickerProviderStateMixin {
  AnimationController animController;
  Animation<double> openOptions;
  geo.Position res;
List<String> imag=['assets/icons/5 usd.png','assets/icons/10 usd.png','assets/icons/10 usd.png'];
List<String> tit=['Free Package','First Package','Seconde Package'];
List<String> des=['0 Dollars','140 Dollars','500 Dollars'];
  Future<bool> getLocationPermission() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {}
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {}
    }

    _locationData = await location.getLocation();
    print(_locationData);
    setState(() {
      res = geo.Position(
          latitude: _locationData.latitude, longitude: _locationData.longitude);

    });
  }

  Future<void> getCurrentLocation() async {
    geo.Position posiion = await geo.getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
    setState(() {
      res = posiion;
      //    _createMarker();

    });
  }
  @override
  void initState() {
    animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    openOptions = Tween(begin: 0.0, end: 300.0).animate(animController);
    getLocationPermission();
    getCurrentLocation();
    //  getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Select Package',
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
    return Scaffold(
      body:ListView(shrinkWrap: true,children: <Widget>[
        Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/back.png'),
                      fit: BoxFit.cover)),
              child:Container(
                  decoration: BoxDecoration(
                    color: transparentYellow,
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(left: 2.0, top: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Spacer(flex:1),


                        Center(child: title),
                        Padding(padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                        child: Container(child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap:
                            true,

                            itemCount:
                            3,
                            itemBuilder:
                                (BuildContext
                            ctxt,
                                int index) {
                              return new Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.white,image: DecorationImage(image: AssetImage(imag[index]),fit:
                                  BoxFit.fill)),
                                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      //   Image.asset('assets/icons/10 usd.png'),
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Text(
                                              tit[index],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20, 10, 20, 100),
                                            child: Text(
                                              des[index],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );}),height: 250,),),


                        //   registerForm,
                        //  Spacer(flex:2),

                        Center(
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  getLocationPermission();
                                  getCurrentLocation();
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => MainPage(res)));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 80,
                                  child: Center(
                                      child: new Text("Ok",
                                          style: const TextStyle(
                                              color: const Color(0xfffefefe),
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20.0))),
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
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
                              )),
                        )
                      ],
                    ),
                  ))),


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
        ])
      ],),
    );
  }
}

class YellowDollarButton extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    canvas.drawCircle(Offset(width / 2, height / 2), height / 2,
        Paint()..color = Color.fromRGBO(253, 184, 70, 0.2));
    canvas.drawCircle(Offset(width / 2, height / 2), height / 2 - 4,
        Paint()..color = Color.fromRGBO(253, 184, 70, 0.5));
    canvas.drawCircle(Offset(width / 2, height / 2), height / 2 - 12,
        Paint()..color = Color.fromRGBO(253, 184, 70, 1));
    canvas.drawCircle(Offset(width / 2, height / 2), height / 2 - 16,
        Paint()..color = Color.fromRGBO(255, 255, 255, 0.1));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
