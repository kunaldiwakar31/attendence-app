import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Authentication/Authenticate.dart';

class CustomDrawer extends StatelessWidget {
  final String name;
  final String email;

  CustomDrawer({required this.name, required this.email});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage:
                  'data:image/png;base64,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',
              name: name,
              email: email,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 2, color: Colors.white),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  buildMenuItem(
                    text: 'Account',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signout() async {
    try {
      print('Logout');
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        signout();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const Authenticate();
        }));
    }
  }
}

Widget buildHeader({
  required String urlImage,
  required String name,
  required String email,
}) =>
    InkWell(
      child: Container(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 35, backgroundImage: NetworkImage(urlImage)),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = Colors.white;
  const hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: const TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
