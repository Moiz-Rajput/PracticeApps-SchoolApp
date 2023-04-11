import 'dart:convert';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_management/globals.dart';
import 'package:school_management/globals.dart' as globals;
import 'package:http/http.dart' as http;

import '../Repository.dart';
import 'HomePage.dart';

class AllFeaturesScreen extends StatefulWidget {
  const AllFeaturesScreen({Key key}) : super(key: key);

  @override
  State<AllFeaturesScreen> createState() => _AllFeaturesScreenState();
}

class _AllFeaturesScreenState extends State<AllFeaturesScreen> {
  int _page = 0;

  // Future<void> _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  // }
  //  String  user;
  //  User currentUser;
  // final _auth = FirebaseAuth.instance;
/*  void getCurrentUser() async {
    user = _auth.currentUser;
    try {
      if (user != null) {
        currentUser = user;
        print("email is : ${currentUser.email}");
      }
    } catch (e) {
      print(e);
    }
  }*/

  Future<void> _signOut() async {
    // await FirebaseAuth.instance.signOut().then((value) =>
    //     Navigator.pushNamed(context, '/')
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),

    // );
    // try {
    //   if (user != null) {
    //     _auth.signOut();
    //     Navigator.pop(context);
    //   }
    //   ;
    // } catch (e) {
    //   print("error is: " + e.toString()); // TODO: show dialog with error
    // }
  }

  Future<void>  SubmitData() async {
    Repository repo = Repository();
    await repo.initdb();

  }
  void testing()async{
    var TimeStamp='Moiz';
    // _signOut;
    // Navigator.pushNamed(context, 'Login');
    var QueryParameters = <String, String>{
      "problems_resolved": TimeStamp,
    };
    var url = Uri.http(globals.ServerURL,
        '/school_portal/Testing', QueryParameters);
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
      },
    );
    print(response.statusCode);
    var responseBody = json.decode(response.body);
    print(responseBody);
    print("Moiz executed success1");
  }

  @override
  void initState() {
    super.initState();
  SubmitData();
  }


  Widget bodyFunction() {
    switch (_page) {
      case 0:
        return GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'AdmissionScreen');
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Image.asset(
                      'images/admission.png',
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    const Text("New Admissions"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'Classes');
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Image.asset(
                      'images/admission.png',
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    const Text("Classes"),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  Image.asset(
                    'images/update.png',
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  const Text("Update Existing Students Data"),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  Image.asset(
                    'images/cashflow.png',
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  const Text("Maintain CashFlow"),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  Image.asset(
                    'images/teachersalery.png',
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  const Text("Teachers Salary"),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
             testing();

              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Image.asset(
                      'images/teachersalery.png',
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    const Text("Signout"),
                  ],
                ),
              ),
            )

            // GestureDetector(
            //   onTap: () => Navigator.of(context).pushNamed("ProductDetails"),
            //   // onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //   //     builder: (BuildContext context) =>
            //   //         const ProductDetailScreen())),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width / 2,
            //     child: Column(
            //       children: [
            //         Hero(
            //           tag: 'imageTag',
            //           child: SizedBox(
            //             height: MediaQuery.of(context).size.height / 7,
            //             child: Image.asset('images/demoimage4.jpg'),
            //           ),
            //         ),
            //         // Image.asset(
            //         //   'images/demoimage4.jpg',
            //         //   height: MediaQuery.of(context).size.height / 6,
            //         // ),
            //         const Text("Keyboard"),
            //         const Text("This is a Keyboard"),
            //         const Text("1000"),
            //         const Text("Ratings"),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        );
        break;
      case 1:
        return Container(color: Colors.blue);
        break;
      case 2:
        return Container(color: Colors.orange);
        break;
      case 3:
        return   Container(
          color: Theme.of(context).backgroundColor,
          child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [ Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                           Text("Hi Ahmad!",style: TextStyle(fontFamily: kTextFont,fontSize: 25)),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              'images/student.jpeg',
                              height: 200,
                              width: 200,
                            ),
                          ),
                        ],
                      )


                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     color: Colors.redAccent,
                      //   ),
                      //   child: Image.asset(
                      //     'images/student.jpeg',
                      //   ),
                      // ),
                    ],
                  ),
                Container(
                  height: 6,
                  color: Theme.of(context).bottomAppBarColor,
                ),
                const ListTile(
                  tileColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2,color: kPrimaryColor),
                      borderRadius:BorderRadiusDirectional.all(Radius.circular(7)),
                  ),
                  title:  Text("Fee Particulars"),
                  subtitle:  Text("Fee Makings"),
                ),
                Container(
                  height: 6,
                  color: Theme.of(context).bottomAppBarColor,
                ),
                const ListTile(
                  tileColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2,color: kPrimaryColor),
                    borderRadius:BorderRadiusDirectional.all(Radius.circular(7)),
                  ),
                  title:  Text("Fee Structure"),
                  subtitle:  Text("Fee Structures"),
                ),
                Container(
                  height: 6,
                  color: Theme.of(context).bottomAppBarColor,
                ),
                const ListTile(
                  tileColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2,color: kPrimaryColor),
                    borderRadius:BorderRadiusDirectional.all(Radius.circular(7)),
                  ),
                  title:  Text("Special Discount"),
                  subtitle:  Text("Discounts in fee"),
                ),
                Container(
                  height: 6,
                  color: Theme.of(context).bottomAppBarColor,
                ),
                const ListTile(
                  tileColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2,color: kPrimaryColor),
                    borderRadius:BorderRadiusDirectional.all(Radius.circular(7)),
                  ),
                  title:  Text("Upload Data"),
                  subtitle:  Text("Upload latest data which is in mobile."),
                ),
                Container(
                  height: 6,
                  color: Theme.of(context).bottomAppBarColor,
                ),
                const ListTile(
                  tileColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2,color: kPrimaryColor),
                    borderRadius:BorderRadiusDirectional.all(Radius.circular(7)),
                  ),
                  title:  Text("Logout"),
                ),


              ],
            ),
          ),
        );
        break;

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: bodyFunction(),
      ),
      appBar: AppBar(
        title: const Text("Features Screen"),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: MediaQuery.of(context).size.width / 8,
        color: Theme.of(context).bottomAppBarColor,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).backgroundColor,
        // backgroundColor: Colors.blueAccent,
        items: const <Widget>[
          Icon(Icons.home_sharp, size: 30),
          Icon(Icons.search_sharp, size: 30),
          Icon(Icons.shopping_cart_sharp, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
