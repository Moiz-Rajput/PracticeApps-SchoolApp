import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../globals.dart' as globals;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool loading = false;
  final _auth = FirebaseAuth.instance;

  bool isStudent = true;
  bool isManagement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //loading tracking as from modal progress hud
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          //main body as column items.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Animation of logo to make it small or big from welcome screen onwards.
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
              //Text fields for email.
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    globals.email = value;
                  },
                  //  decoration for the email field
                  decoration: globals.kEmailFieldDecoration),
              const SizedBox(
                height: 8.0,
              ),
              // password fields for password
              TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    globals.password = value;
                  },
                  //  field decoration for password place in constant dart file
                  decoration: globals.kPasswordFieldDecoration),
              const SizedBox(
                height: 24.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color:
                          isStudent == true ? Colors.grey : Colors.blueAccent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          isStudent = true;
                          if (isStudent == true) {
                            setState(
                              () {
                                isManagement = false;
                              },
                            );
                          }
                        },
                        minWidth: MediaQuery.of(context).size.width / 2.6,
                        height: 42.0,
                        child: const Text(
                          'Student',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: isManagement == true
                          ? Colors.grey
                          : Colors.blueAccent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          isManagement = true;
                          if (isManagement == true) {
                            setState(
                              () {
                                isStudent = false;
                              },
                            );
                          }
                        },
                        minWidth: MediaQuery.of(context).size.width / 2.6,
                        height: 42.0,
                        child: const Text(
                          'Management',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(
                        () {
                          loading = true;
                        },
                      );
                      //email and password checking and logging in authentication.
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: globals.email.toString(),
                                password: globals.password.toString());
                        if (newUser != null) {
                          Navigator.pushNamed(context, "MainCategories");
                        }
                      } on FirebaseAuthException catch (error) {
                        //Error message display
                        if (error.toString() == 'firebase_auth/invalid-email') {
                          print("moiz:invalid Email address");
                        }
                        Flushbar(
                          message: "The Flutter Exception is: $error ",
                          icon: const Icon(
                            Icons.notifications_active,
                            size: 28.0,
                            color: Colors.blueAccent,
                          ),
                          duration: const Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.blueAccent,
                        ).show(context);
                      } catch (error) {
                        print('moiz:Generic Errors has occured');
                      }
                      setState(() {
                        loading = false;
                      });
                      //Implement registration functionality.
                      print(globals.email);
                      print(globals.password);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
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
// final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// firebaseAuth
//     .signInWithEmailAndPassword(
// email: emailController.text, password: passwordController.text)
// .then((result) {
// firestoreInstance
//     .collection('Users')
//     .document(usernameController.text)
//     .get()
//     .then((value) {
// var userType = (value.data)['userType'];
// if (userType == "firstType") {
// Navigator.pushReplacementNamed(context, '/homepage');
// }
// else if (userType == "secondType") {
// Navigator.pushReplacementNamed(context, '/anotherpage');
// }
// });
// }
