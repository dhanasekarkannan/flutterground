import 'package:flutter/material.dart';
import 'package:flutterground/widgets/drawer_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: Text('Google Fonts'),),
      drawer: DrawerWidget(),
      
    );
  }
}
