import 'package:flutter/material.dart';
import 'package:flutterground/widgets/drawer_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsScreen extends StatelessWidget {
  static const String routeName = "/google_fonts";
  final String _subtitle = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Google Fonts',
          style: GoogleFonts.fruktur(
            textStyle: TextStyle(color: Colors.amber),
            fontSize: 25,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "loveYaLikeASister",
                style: GoogleFonts.loveYaLikeASister(),
              ),
              subtitle: Text(_subtitle, style: GoogleFonts.loveYaLikeASister()),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text(
                "gabriela",
                style: GoogleFonts.gabriela(),
              ),
              subtitle: Text(_subtitle, style: GoogleFonts.gabriela()),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text(
                "herrVonMuellerhoff",
                style: GoogleFonts.herrVonMuellerhoff(),
              ),
              subtitle: Text(
                _subtitle,
                style: GoogleFonts.herrVonMuellerhoff(),
              ),
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
