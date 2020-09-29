import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giftlink/app_properties.dart';
import 'package:giftlink/main_page.dart';
import 'package:giftlink/product_page.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:giftlink/wallet/wallet_page.dart';
import 'package:location/location.dart';

class catPAge extends StatefulWidget {
  @override
  _catPAge createState() => _catPAge();
}

class _catPAge extends State<catPAge> with TickerProviderStateMixin {
  AnimationController animController;
  Animation<double> openOptions;
  geo.Position res;
  bool _isChecked = true;
  String _currText = '';

  List<String> text = ["InduceSmile.com", "Flutter.io", "google.com"];
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
      'Select Category',
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
      body: ListView(children: <Widget>[Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/back.png'),
                  fit: BoxFit.cover)),child: Container(
          decoration: BoxDecoration(
            color: transparentYellow,
          ),child:  Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Spacer(flex:1),
              Center(child: title),
              Container(
                height: 350.0,
                child: Column(
                  children: text
                      .map((t) => CheckboxListTile(
                    title: Text(t,style: TextStyle(fontWeight: FontWeight.bold),),
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val;
                        if (val == true) {
                          _currText = t;
                        }
                      });
                    },
                  ))
                      .toList(),
                ),
              ),

              //   registerForm,
              //  Spacer(flex:2),

              Center(
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => WalletPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 80,
                        child: Center(
                            child: new Text("Next",
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
        ),
        ),),


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
      ])],shrinkWrap: true,),
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
