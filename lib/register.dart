import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String error = '';
  String? userType = 'Student';
  final userTypes = ['Student', 'Teacher'];
  late UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      backgroundColor: const Color.fromARGB(255, 37, 130, 236),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  validator: (val) => val!.isEmpty ? 'Enter the name !!' : null,
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email Id',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      value: userType,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: userTypes.map(buildMenuItem).toList(),
                      onChanged: (value) => {
                        setState(() {
                          userType = value;
                        })
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .catchError((e) {
                        print(e);
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
      value: item, child: Text(item, style: const TextStyle(fontSize: 16)));
}
