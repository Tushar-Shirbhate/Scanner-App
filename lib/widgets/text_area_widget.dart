import 'package:flutter/material.dart';

class TextAreaWidget extends StatefulWidget {
  final String title;
   String text;
  final VoidCallback onClickedCopy;
  final VoidCallback onClickedClear;

   TextAreaWidget({
    required this.title,
     required this.text,
    required this.onClickedCopy,
    required this.onClickedClear,
    Key? key,
  }) : super(key: key);

  @override
  State<TextAreaWidget> createState() => _TextAreaWidgetState();
}

class _TextAreaWidgetState extends State<TextAreaWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff8f94fb),
        actions: [
          IconButton(
            icon: Icon(Icons.copy, color: Colors.white),
            color: Colors.white,
            onPressed: widget.onClickedCopy,
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            color: Colors.white,
            onPressed: (){
              setState(() {
                widget.text= "";
              });
            },
          ),
        ],
      ),
      body: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: size.height,
              //decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: SelectableText(
                widget.text.isEmpty ? "" : widget.text,
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  void clear(){
    // setImage(Icon(Icons.photo));
    setText('');
  }

  void setText(String newText){
    setState(() {
      widget.text = newText;
    });
  }
}