import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giftlink/rating/rating_page.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'dart:io';

import 'package:toast/toast.dart';

class storeDetails extends StatefulWidget {
  @override
  _storeDetails createState() => new _storeDetails();
}

class _storeDetails extends State<storeDetails> {
  int _current = 0;
  String isfav = '0';
  List<String> imagess = [
    'assets/rest.jpg',
    'assets/restf.jpg',
    'assets/restfo.jpg',
    'assets/restsi.jpg',
    'assets/restt.jpg',
    'assets/restth.jpg'
  ];

  List<String> titles = [
    'Discount',
    'Gift',

  ];


  List<String> dess = [
    'Include Discount 20%  from the invoice value ',
    'This offer include With every lunch there is a salad of your choice as a gift',

  ];

  final _ownerD = new TextEditingController();
  var _ratingController = TextEditingController();
  double _rating;
  double _userRating = 3.0;
  int _ratingBarMode = 1;
  bool _isRTLMode = false;
  bool _isVertical = false;
  IconData _selectedIcon;
  var rating = 3.0;
  ScanResult scanResult;

  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var contentList = <Widget>[
      if (scanResult != null)
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Result Type"),
                subtitle: Text(scanResult.type?.toString() ?? ""),
              ),
              ListTile(
                title: Text("Raw Content"),
                subtitle: Text(scanResult.rawContent ?? ""),
              ),
              ListTile(
                title: Text("Format"),
                subtitle: Text(scanResult.format?.toString() ?? ""),
              ),
              ListTile(
                title: Text("Format note"),
                subtitle: Text(scanResult.formatNote ?? ""),
              ),
            ],
          ),
        ),
      ListTile(
        title: Text("Camera selection"),
        dense: true,
        enabled: false,
      ),
      RadioListTile(
        onChanged: (v) => setState(() => _selectedCamera = -1),
        value: -1,
        title: Text("Default camera"),
        groupValue: _selectedCamera,
      ),
    ];
    for (var i = 0; i < _numberOfCameras; i++) {
      contentList.add(RadioListTile(
        onChanged: (v) => setState(() => _selectedCamera = i),
        value: i,
        title: Text("Camera ${i + 1}"),
        groupValue: _selectedCamera,
      ));
    }

    contentList.addAll([
      ListTile(
        title: Text("Button Texts"),
        dense: true,
        enabled: false,
      ),
      ListTile(
        title: TextField(
          decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            labelText: "Flash On",
          ),
          controller: _flashOnController,
        ),
      ),
      ListTile(
        title: TextField(
          decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            labelText: "Flash Off",
          ),
          controller: _flashOffController,
        ),
      ),
      ListTile(
        title: TextField(
          decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            labelText: "Cancel",
          ),
          controller: _cancelController,
        ),
      ),
    ]);
    if (Platform.isAndroid) {
      contentList.addAll([
        ListTile(
          title: Text("Android specific options"),
          dense: true,
          enabled: false,
        ),
        ListTile(
          title:
          Text("Aspect tolerance (${_aspectTolerance.toStringAsFixed(2)})"),
          subtitle: Slider(
            min: -1.0,
            max: 1.0,
            value: _aspectTolerance,
            onChanged: (value) {
              setState(() {
                _aspectTolerance = value;
              });
            },
          ),
        ),
        CheckboxListTile(
          title: Text("Use autofocus"),
          value: _useAutoFocus,
          onChanged: (checked) {
            setState(() {
              _useAutoFocus = checked;
            });
          },
        )
      ]);
    }

    contentList.addAll([
      ListTile(
        title: Text("Other options"),
        dense: true,
        enabled: false,
      ),
      CheckboxListTile(
        title: Text("Start with flash"),
        value: _autoEnableFlash,
        onChanged: (checked) {
          setState(() {
            _autoEnableFlash = checked;
          });
        },
      )
    ]);

    contentList.addAll([
      ListTile(
        title: Text("Barcode formats"),
        dense: true,
        enabled: false,
      ),
      ListTile(
        trailing: Checkbox(
          tristate: true,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: selectedFormats.length == _possibleFormats.length
              ? true
              : selectedFormats.length == 0 ? false : null,
          onChanged: (checked) {
            setState(() {
              selectedFormats = [
                if (checked ?? false) ..._possibleFormats,
              ];
            });
          },
        ),
        dense: true,
        enabled: false,
        title: Text("Detect barcode formats"),
        subtitle: Text(
          'If all are unselected, all possible platform formats will be used',
        ),
      ),
    ]);
    contentList.addAll(_possibleFormats.map(
          (format) => CheckboxListTile(
        value: selectedFormats.contains(format),
        onChanged: (i) {
          setState(() => selectedFormats.contains(format)
              ? selectedFormats.remove(format)
              : selectedFormats.add(format));
        },
        title: Text(format.toString()),
      ),
    ));
    return new Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Offers Shaplin'),
          backgroundColor: Colors.orangeAccent,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Icon(Icons.location_on),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Icon(Icons.more_horiz),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return new Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 250,
                              child: Stack(
                                children: <Widget>[
                                  CarouselSlider(
                                      items: imagess.map((i) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return GestureDetector(child:  Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(20)),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        i.toString()),
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                return DetailScreen(i);
                                              }));
                                            },);
                                          },
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                        height: 250,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        },
                                        initialPage: 0,
                                        //  enableInfiniteScroll: true,
                                        // reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 15),
                                        //autoPlayAnimationDuration: Duration(milliseconds: 800),
                                        //autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        // scrollDirection: Axis.horizontal,
                                      )),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: imagess.map((url) {
                                        int index = imagess.indexOf(url);
                                        return Container(
                                          width: 8.0,
                                          height: 8.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _current == index
                                                ? Colors.orangeAccent
                                                : Colors.deepOrange,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        visible: true,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            // alignment: Alignment.bottomLeft,

                            // height: 60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Colors.orange, width: 1))),
                                  child: FlatButton(
                                      onPressed: () {
                                        if (isfav == '0') {
                                          setState(() {
                                            isfav = '1';
                                          });
                                        } else {
                                          setState(() {
                                            isfav = '0';
                                          });
                                          print(isfav);
                                        }

                                        print(isfav);
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(3, 0, 3, 0),
                                            child: isfav == '0'
                                                ? Icon(Icons.favorite_border)
                                                : Icon(
                                                    Icons.favorite,
                                                    color: Colors.orange,
                                                  ),
                                          ),
                                          Text('Favourites',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.greyapp,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  alignment: Alignment.center,
                                  child: FlatButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return showDialogwindowDone();
                                            });
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(3, 0, 3, 0),
                                            child: Icon(Icons.add_comment),
                                          ),
                                          Text(
                                            'Complain',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.greyapp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            )),
                      ),
                      Divider(
                        height: 0,
                        color: Colors.orange,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Container(
                         //   width: MediaQuery.of(context).size.width / 1.2,
                            // alignment: Alignment.bottomLeft,

                            // height: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(onTap: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => RatingPage('1')));
                                },child:   Container(
                                  alignment: Alignment.center,
                                  child: Padding(padding: EdgeInsets.all(5),child: Row(
                                    children: <Widget>[
                                  Padding(padding:
                                  EdgeInsets.fromLTRB(23, 0, 10, 0),child:
                                  Text('Reviews ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))),new Spacer(),Padding(padding:
                                        EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios,
                                      color: Colors.orange,),)
                                    ],
                                  ),),
                                ),)
                              ,
                                Divider(
                                  height: 0,
                                  color: Colors.orange,
                                ),
                              /*  Padding(padding: EdgeInsets.all(10),
                                child: Center(
                                    child: SmoothStarRating(
                                      rating: rating,
                                      isReadOnly: false,
                                      size: 40,
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star_half,
                                      defaultIconData: Icons.star_border,
                                      starCount: 5,
                                      color: Colors.orange,
                                      borderColor: Colors.orangeAccent,
                                      allowHalfRating: true,
                                      spacing: 2.0,
                                      onRated: (value) {
                                        print("rating value -> $value");
                                        setState(() {
                                          rating=value;
                                        });
                                        // print("rating value dd -> ${value.truncate()}");
                                      },
                                    )),),*/
                              ],
                            )),
                      ),


                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            // alignment: Alignment.bottomLeft,

                            // height: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(padding: EdgeInsets.all(5),child: Row(
                                    children: <Widget>[

                                      Text('Preview Offer' ,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),),
                                ),
                                Padding(padding: EdgeInsets.all(10),
                                  child:  Container(height:250,child:
                                  ListView.builder(
                                      itemCount: 2,
                                      itemBuilder: (BuildContext context, int index) {

                                        return new Padding(
                                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),child:  Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border:
                                        Border.all(width: 1,color: Colors.orange)),child:
                                        Padding(padding: EdgeInsets.all(5),child:
                                        Column(children: <Widget>[
                                          Row(children: <Widget>[
                                            Text(titles[index],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                          new Spacer(),                                Padding(padding: EdgeInsets.all(0),
                                              child: Column(children: <Widget>[
                                                FlatButton(
                                                    onPressed: () {
                                                      scan();
                                                    },
                                                    child: Row(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.fromLTRB(3, 0, 3, 0),
                                                          child: Icon(Icons.camera),
                                                        ),

                                                      ],
                                                    )),

                                              ],),),
                                          ],),
                                          Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 3),child:Text(dess[index],style: TextStyle(color: Colors.greyapp),))
                                        ],),),));



                                      })),),
                              ],
                            )),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            // alignment: Alignment.bottomLeft,

                            // height: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(padding: EdgeInsets.all(5),child: Row(
                                    children: <Widget>[
                                      scanResult==null?
                                      Text('Your barcode :   ' ,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)):
                                      Text('Your barcode :   ' + scanResult.rawContent,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),),
                                ),

                              ],
                            )),
                      ),

                    ],
                  ),
                );
              }),
        ));
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
                          'Add Complain',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: _ownerD,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Enter Your Complain',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ), //can also add icon to the end of the textfiled
                          //  suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
                      child: new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();

                            Toast.show(
                                'Your complain has been added ,thanks for support',
                                context,
                                duration: 4,
                                gravity: Toast.BOTTOM);

                            //    _buildSubmitFormCo(context, wareId, offerId, dateD);
                          }
                          //  textColor: Colors.yellow,colorBrightness: Brightness.dark,
                          ,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          color: Colors.orangeAccent,
                          child: Center(
                            child: new Text(
                              'Add',
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
  Future scan() async {
    try {
      var options = ScanOptions(
        strings: {
          "cancel": _cancelController.text,
          "flash_on": _flashOnController.text,
          "flash_off": _flashOffController.text,
        },
        restrictFormat: selectedFormats,
        useCamera: _selectedCamera,
        autoEnableFlash: _autoEnableFlash,
        android: AndroidOptions(
          aspectTolerance: _aspectTolerance,
          useAutoFocus: _useAutoFocus,
        ),
      );

      var result = await BarcodeScanner.scan(options: options);

      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );

      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'The user did not grant the camera permission!';
        });
      } else {
        result.rawContent = 'Unknown error: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
  }
}
class DetailScreen extends StatefulWidget {
  final String ink;
  DetailScreen(this.ink);
  @override
  _DetailScreen createState() => new _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.asset(widget.ink,fit: BoxFit.fill,),
    );
  }



}