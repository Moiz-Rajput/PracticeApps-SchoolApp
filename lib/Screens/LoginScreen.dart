import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_database/firebase_database.dart';

import '../globals.dart' as globals;

//Login screen where the user login an existing account.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //boolean to track the loading time.

  bool loading = false;
  // firebase authentication initialization
  // final _auth = FirebaseAuth.instance;
  //email and password as a string

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Future GetActiveUsers() async {
  //   List<Map<String, dynamic>> ActiveUserList = await repo.getActiveUser();
  //   if (ActiveUserList.length != 0) {
  //     globals.DisplayName = ActiveUserList[0]["display_name"];
  //     globals.UserID = ActiveUserList[0]["user_id"];
  //     globals.isTeamLeader = ActiveUserList[0]["is_team_leader"];
  //     globals.UserPassword = ActiveUserList[0]["password"];
  //     globals.isLocalLoggedIn = 0;
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => HomePage()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //loading tracking as from modal progress hud
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          //Logo and all the fields for the contents.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //The Logo animation came from welcome screen to login screen
              Hero(
                tag: 'logoTag',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              //email textfield
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    globals.email = value;
                  },
                  //decoration for email field placed in constant library file.
                  decoration: globals.kEmailFieldDecoration),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  onChanged: (value) {
                    globals.password = value;
                  },
                  obscureText: true,

                  //  password field decoration placed in library file of constants.
                  decoration: globals.kPasswordFieldDecoration),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(
                        () {
                          loading = true;
                        },
                      );

                      try{



                      }catch(e){
                        print(e);
                      }
                      // try {
                      //   //logging authentication check
                      //   if (globals.email != null && globals.password != null) {
                      //     globals.loginUser =
                      //         await _auth.signInWithEmailAndPassword(
                      //             email: globals.email,
                      //             password: globals.password);
                      //     if (globals.loginUser != null) {
                      //       // Navigator.pushNamed(context, 'contactScreen');
                      //       Navigator.pushNamed(context, 'FeatureScreen');
                      //     }
                      //     setState(
                      //       () {
                      //         loading = false;
                      //       },
                      //     );
                      //   }
                      // } on FirebaseAuthException catch (error) {
                      //   //firebase authentication errors checking and displaying
                      //   Flushbar(
                      //     message: "The Flutter Exception is: $error ",
                      //     icon: const Icon(
                      //       Icons.notifications_active,
                      //       size: 28.0,
                      //       color: Colors.pink,
                      //     ),
                      //     duration: const Duration(seconds: 3),
                      //     leftBarIndicatorColor: Colors.pink,
                      //   ).show(context);
                      // }
                      setState(
                        () {
                          loading = false;
                        },
                      );
                      print(globals.email);
                      print(globals.password);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: const Text(
                      'Log In',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
