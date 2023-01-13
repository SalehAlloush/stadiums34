import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(31.94553, 35.98655);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text('حجز الملاعب',style: TextStyle(fontSize: 30,color: Colors.black),),
          shape:
          Border(
              top: BorderSide(color: Colors.black),

              bottom: BorderSide(color: Colors.black)),
          backgroundColor: Colors.lightGreenAccent[400],
        ),


        body: Container(
          padding: EdgeInsets.only(left: 15,right: 15),

          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),


                Container(

                  height: 50,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(color: Colors.black),
                    color: Colors.lightGreenAccent[400],
                  ),

                  child:
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.gps_fixed,size: 30,)),
                      SizedBox(width: 70),
                      Text(
                        'حدد موقعك الحالي',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 385,
                  child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),),
                SizedBox(height: 10,),

                Container(
                    child:

                    MaterialButton(onPressed: (){},
                        height: 60,
                        minWidth: 300,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.black)
                        ),
                        color: Colors.lightGreenAccent[400],

                        child: Text('احجز الآن',style: TextStyle(fontSize: 25,color: Colors.black),)


                    )
                )
              ]),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/profile');
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                    icon: Icon(
                      Icons.home,
                      color: Colors.green,
                    )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.directions_run,
                    color: Colors.green,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.stadium,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
