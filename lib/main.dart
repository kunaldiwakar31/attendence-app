import 'package:attendence_app/TeachersBloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Authenticate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCrCQ_K9NnYOm9oHP--j9bS8xqlF8aFiBg",
      appId: "1:464336117304:android:81350501635315642350cd",
      messagingSenderId: "464336117304",
      projectId: "attendence-app-f3f49",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TeachersBloc>(
      create: (_) => TeachersBloc(),
      child: const MaterialApp(home: Authenticate()),
    );
  }
}
