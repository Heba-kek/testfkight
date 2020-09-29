import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:giftlink/app_properties.dart';
import 'package:giftlink/rating/rating_dialog.dart';


class RatingPage extends StatefulWidget {
  final String namme;
  RatingPage(this.namme);
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0.0;
  List<int> ratings = [2, 1, 5, 2, 4, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.orangeAccent,
          brightness: Brightness.light,
         // iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/icons/comment.png'),
              onPressed: () {
                showDialog(
                    context: context,
                    child: Dialog(
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: RatingDialog(widget.namme),
                    ));
              },
              color: Colors.black,
            ),
          ],
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (b, constraints) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),


                            child:widget.namme=='1'?Image.asset('assets/restsi.jpg'):
                            Image.asset('assets/choco.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 72.0, vertical: 16.0),
                            child: widget.namme=='1'?Text(
                              'Chaplin Resturant',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ):Text(
                              'Choco Swamp',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Text(
                                '4.8',
                                style: TextStyle(fontSize: 48),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                FlutterRatingBar(
//                      borderColor: Color(0xffFF8993),
//                      fillColor: Color(0xffFF8993),
                                  ignoreGestures: true,
                                  itemSize: 20,
                                  allowHalfRating: true,
                                  initialRating: 1,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  fullRatingWidget: Icon(
                                    Icons.favorite,
                                    color: Color(0xffFF8993),
                                    size: 20,
                                  ),
                                  noRatingWidget: Icon(Icons.favorite_border,
                                      color: Color(0xffFF8993), size: 20),
                                  onRatingUpdate: (value) {
                                    setState(() {
                                      rating = value;
                                    });
                                    print(value);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text('from 25 people'),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Align(
                            alignment: Alignment(-1, 0),
                            child: Text('Recent Reviews')),
                      ),
                      Column(
                        children: <Widget>[
                          ...ratings
                              .map((val) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5.0))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: CircleAvatar(
                                          maxRadius: 14,
                                          backgroundImage:
                                              AssetImage('assets/background.jpg'),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Hani',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '10 am',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10.0),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: FlutterRatingBar(
//                                borderColor: Color(0xffFF8993),
//                                fillColor: Color(0xffFF8993),
                                                ignoreGestures: true,
                                                itemSize: 20,
                                                allowHalfRating: true,
                                                initialRating: val.toDouble(),
                                                itemPadding: EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                                fullRatingWidget: Icon(
                                                  Icons.favorite,
                                                  color: Color(0xffFF8993),
                                                  size: 14,
                                                ),
                                                noRatingWidget: Icon(
                                                    Icons.favorite_border,
                                                    color: Color(0xffFF8993),
                                                    size: 14),
                                                onRatingUpdate: (value) {
                                                  setState(() {
                                                    rating = value;
                                                  });
                                                  print(value);
                                                },
                                              ),
                                            ),
                                            Text(
                                              'Very nice',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  )))
                              .toList()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}