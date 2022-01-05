import 'package:flutter/material.dart';
import 'package:scanner_app/widgets/text_area_widget.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final String text;
  final VoidCallback onClickedCopy;

  const ControlsWidget({
    required this.onClickedPickImage,
    required this.onClickedScanText,
    required this.text,
    required this.onClickedCopy,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        InkWell(
            onTap: onClickedPickImage,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius. circular(8),
              ),
              child: Container(
                height:40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                    color: Color(0xff8f94fb),
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Pick Image',style: TextStyle(color: Colors.white))),
                  )),
            )
        ),
        const SizedBox(width:12),
        InkWell(
            onTap: onClickedScanText,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius. circular(8),
              ),
              child: Container(
                  height:40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff8f94fb),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Scan For Text',style: TextStyle(color: Colors.white))),
                  )),
            )
        ),

      ]
    );
  }
}
