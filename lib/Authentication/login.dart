import 'package:attendence_app/AppConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home/StudentHome.dart';
import '../Home/TeacherHome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Theme.of(context).primaryColorLight,
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email Id',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter the email !!' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    validator: (val) => val!.length < 6
                        ? 'Password must be atleast of 6 character !!'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        signInWithEmailAndPassword(email, password);
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent),
                        elevation: MaterialStateProperty.all(10),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0)))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ])),
          ),
        ));
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String uid = value.user!.uid;

        var future = await FirebaseFirestore.instance
            .collection(AppConstants.usersCollection)
            .where('uid', isEqualTo: uid)
            .get();
        if (future.docs.isEmpty) {
          print('Fail');
        }
        future.docs.forEach((element) {
          var userType = element.data()['userType'];
          userType == 'Student'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentHome(
                            uid: uid,
                          )))
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherHome(
                            uid: uid,
                          )));
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
