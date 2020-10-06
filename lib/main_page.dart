
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:giftlink/app_properties.dart';
import 'package:giftlink/category_list_page.dart';
import 'package:giftlink/models/components/custom_bottom_bar.dart';
import 'package:giftlink/models/components/product_list.dart';
import 'package:giftlink/models/components/tab_view.dart';
import 'package:giftlink/models/product.dart';
import 'package:giftlink/notifications_page.dart';
import 'package:location/location.dart';

import 'package:giftlink/profile_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;

import 'custom_background.dart';


class MainPage extends StatefulWidget {
  geo.Position res;
  MainPage(this.res);
  @override
  _MainPageState createState() => _MainPageState();
}

List<String> timelines = ['Weekly featured', 'Best of June', 'Best of 2018'];
String selectedTimeline = 'Weekly featured';

List<Product> products = [
  Product(
      'assets/headphones_2.png',
      'Skullcandy headset L325',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      102.99),
  Product(
      'assets/headphones_3.png',
      'Skullcandy headset X25',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      55.99),
  Product(
      'assets/headphones.png',
      'Blackzy PRO hedphones M003',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      152.99),
];

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  SwiperController swiperController;

  TabController tabController;
  TabController bottomTabController;

  Set<Marker> markers;

  GoogleMapController mapController;

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('Your Location'),
          position: LatLng(widget.res.latitude, widget.res.longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Your Location'))
    ].toSet();
  }


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
    _createMarker();
    markers = _createMarker();

  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = Container( color:Colors.orangeAccent,
      height:60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(

              icon: Image.asset('assets/log.png')),new Spacer(),
          IconButton(
              icon: Icon(Icons.notifications,color: Colors.black,),onPressed: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NotificationsPage()));
          },),

        ],
      ),
    );


    Widget tabBar = TabBar(
      tabs: [

        Tab(text: 'Foods'),
        Tab(text: 'Beauty'),


      ],
      indicatorSize: TabBarIndicatorSize.tab,

      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: darkGrey,

      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: tabController,
    );

    return Scaffold(
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[


                    SliverToBoxAdapter(
                      child:SingleChildScrollView(child: Column(children: <Widget>[ appBar,
                        Container(height:200,child:Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child:

                          WillPopScope(
                            onWillPop: () async => false,
                            child: Scaffold(
                              body: Stack(
                                children: <Widget>[
                                  GoogleMap(
                                    markers: markers,
                                    initialCameraPosition: CameraPosition(
                                        target: LatLng(widget.res.latitude, widget.res.longitude),
                                        zoom: 15.0),
                                    mapType: MapType.normal,
                                    onTap: (position) {
                                      Marker mk1 = Marker(
                                        infoWindow: InfoWindow(
                                            title: position.latitude.toString() +
                                                ',' +
                                                position.longitude.toString()),
                                        markerId: MarkerId('1'),
                                        position: position,
                                      );

                                      setState(() {
                                        markers.clear();
                                        markers.add(mk1);


// Save a value
                                        // Navigator.of(context).pop();

                                        print(position.latitude.toString());
                                      });
                                    },
                                    onMapCreated: _onMapCreated,
                                    /* onMapCreated: (GoogleMapController controller) {

                _controller.complete(controller);

              },
*/
                                  ),
                                ],
                              ),
                            ),
                          )

                          ,)),Column(children: <Widget>[Row(children: <Widget>[
                          Padding(padding:EdgeInsets.all(10),child:
                          Text('Category ', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                          ))
                        ],),
                          tabBar],)],),),

                    ),


                  ];
                },
                body:  TabView(
                  tabController: tabController,
                )
            ),
            CategoryListPage(),
         //   CheckOutPage(),
            ProfilePage(),
            ProfilePage()
          ],
        ),
      ),
    );
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final Set<Polyline> poly = {};
}
