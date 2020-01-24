
import 'dart:io';

import 'package:flutter/material.dart';

import '../providers/helper.dart';
import '../widgets/drawer_widget.dart';

class ImagePickerScreen extends StatefulWidget {
    static const String routeName = '/image_picker';

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  File _image;

  void _getImage(){
    Helper().getImage().then(
      (value) {
        setState(() {
           _image = value;

        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker'),),
      drawer: DrawerWidget(),
      body: Center(child: _image == null ? Text('No image is picked'):Image.file(_image) ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.camera), onPressed: (){
        _getImage();
      },),
    );
  }
}