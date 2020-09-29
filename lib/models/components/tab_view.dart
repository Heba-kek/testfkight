import 'package:flutter/material.dart';
import 'package:giftlink/models/category.dart';
import 'package:giftlink/pages/storeDetails.dart';
import 'package:giftlink/pages/stroechoco.dart';

import 'category_card.dart';
import 'recommended_list.dart';

class TabView extends StatelessWidget {
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Gadgets',
      // 'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Clothes',
      //'assets/jeans_5.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'Fashion',
      //'assets/jeans_5.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Home',
      //'assets/jeans_5.png',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Beauty',
      //'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Appliances',
      //'assets/jeans_5.png',
    ),
  ];

  final TabController tabController;

  TabView({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                          category: categories[index],
                        ))),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Nearby :  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/restsi.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Chaplin resturant',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => storeDetails()));
                    },),
                    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/choco.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Choco Swamp',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => chocoDetails()));
                    },)
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                          category: categories[index],
                        ))),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Nearby :  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/restsi.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Chaplin resturant',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => storeDetails()));
                    },)     ,    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/choco.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Choco Swamp',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => chocoDetails()));
                    },)             ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                          category: categories[index],
                        ))),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Nearby :  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/restsi.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Chaplin resturant',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => storeDetails()));
                    },)        ,    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/choco.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Choco Swamp',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => chocoDetails()));
                    },)          ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                          category: categories[index],
                        ))),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Nearby :  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/restsi.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Chaplin resturant',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => storeDetails()));
                    },)        ,    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/choco.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Choco Swamp',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => chocoDetails()));
                    },)          ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                          category: categories[index],
                        ))),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Nearby :  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/restsi.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Chaplin resturant',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => storeDetails()));
                    },)   ,    GestureDetector(child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.orange),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Image.asset('assets/choco.jpg',height: 60,width: 60,),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Text('Choco Swamp',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            new Spacer(),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.arrow_forward_ios),)],),
                        ),
                      ),
                    ),onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => chocoDetails()));
                    },)               ],
                )
              ],
            ),
          ),
        ]);
  }
}
