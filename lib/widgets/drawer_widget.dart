
import 'package:flutter/material.dart';

import '../screens/image_picker_screen.dart';
import '../screens/google_fonts_screen.dart';
import '../screens/forms_screen.dart';
import '../screens/google_maps_screen.dart';

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
                Navigator.popAndPushNamed(context, GoogleFontsScreen.routeName);
              },
            ),
          ),
          Divider(thickness: 1.0),
          ListTile(
            title: Text('Google Maps'),
            onTap: () {
              Navigator.pushReplacementNamed(context, GoogleMapsScreen.routeName);
            },
          ),
          Divider(thickness: 1.0),
          ListTile(
            title: Text('Forms'),
            onTap: () {
              Navigator.pushReplacementNamed(context, FormsScreen.routeName);
            },
          ),
          Divider(thickness: 1.0),
          ListTile(
            title: Text('Image Picker'),
            onTap: () {
              Navigator.pushReplacementNamed(context, ImagePickerScreen.routeName);
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
