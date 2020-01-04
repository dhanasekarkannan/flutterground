
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Hi how are you!'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.green,
                  Colors.blue,
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.green,
            focusColor: Colors.pink,
            child: ListTile(
              title: Text('Google Fonts'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/google_fonts');
              },
            ),
          ),
          Divider(thickness: 1.0),
          ListTile(
            title: Text('Google Maps'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/google_maps');
            },
          ),
          Divider(thickness: 1.0),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
