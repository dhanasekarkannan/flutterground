
import 'dart:io';
import 'package:image_picker/image_picker.dart';



class Helper {

Future<File> getImage() async{
   final  response = await ImagePicker.pickImage(source: ImageSource.camera);
   return response;  
}

}