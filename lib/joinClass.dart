import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinClass extends StatelessWidget {
  const JoinClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Class"),
      ),
      backgroundColor: const Color.fromARGB(255, 37, 130, 236),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Class Code',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            ElevatedButton(
              onPressed: null,
              onHover: (value) {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Join Class',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
