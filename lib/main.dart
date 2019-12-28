import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import './widgets/drawer_widget.dart';
import './screens/google_fonts_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (context) => MyHomePage( title: 'Home',),
        'google_fonts' : (context) => GoogleFontsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.audiowide(
            textStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi! You have pushed the button this many times:',
              style: GoogleFonts.audiowide(
                  textStyle: Theme.of(context).textTheme.display1,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
