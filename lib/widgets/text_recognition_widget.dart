import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanner_app/api/FirebaseMLApi.dart';

import 'controls_widget.dart';
import 'text_area_widget.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({Key? key}) : super(key: key);

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = "";
  late File image;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(child: buildImage()),
          SizedBox(height: 16),
          ControlsWidget(
            onClickedPickImage: pickImage,
            onClickedScanText: scanText,
              text: text,
              onClickedCopy: copyToClipBoard
          ),
          SizedBox(height: 16),
          // TextAreaWidget(
          //   text: text,
          //   onClickedCopy: copyToClipBoard
          // )
        ]
      )
    );
  }
  Widget buildImage(){
      try{
        return Container(
          child: Image.file(image)
        );
      }
      catch(e){
        return Padding(
          padding: const EdgeInsets.fromLTRB(90,185,70,185),
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/photo.png'),
                    fit: BoxFit.fill
                ),
              )
            // Icon(Icons.photo, size: 80, color: Colors.black)
          ),
        );
      }
  }

  Future pickImage() async{
      final file = await ImagePicker().getImage(source: ImageSource.gallery);
      setImage(File(file!.path));
  }

  Future scanText() async{
    final text = await FirebaseMLApi.recogniseText(image);
    setText(text);

    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>
            TextAreaWidget(title: "Scan Text",text: text, onClickedCopy: copyToClipBoard, onClickedClear:clear)));
    // Navigator.of(context).pop();

  }

  void clear(){
     // setImage(Icon(Icons.photo));
    setText('');
  }

  void copyToClipBoard(){
      if(text.trim() != ''){
        FlutterClipboard.copy(text);
      }
  }

  void setImage(File newImage){
      setState(() {
        image = newImage;
      });
  }

  void setText(String newText){
      setState(() {
        text = newText;
      });
  }
}
