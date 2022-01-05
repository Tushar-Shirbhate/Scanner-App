import 'package:flutter/material.dart';
import 'package:scanner_app/widgets/text_recognition_widget.dart';

class TextRecognizer extends StatefulWidget {
  const TextRecognizer({Key? key}) : super(key: key);

  @override
  _TextRecognizerState createState() => _TextRecognizerState();
}

class _TextRecognizerState extends State<TextRecognizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OCR",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xff8f94fb),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
                SizedBox(height: 25),
                TextRecognitionWidget(),
                SizedBox(height: 25)
              ]
          ),
        )
    );
  }
}
