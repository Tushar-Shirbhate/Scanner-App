import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/screens/scan_qr.dart';
import 'package:scanner_app/screens/text_recognizer.dart';
import 'package:scanner_app/widgets/text_area_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String qrCode = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Scanner App", style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff8f94fb),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Column(
          //   children:[
              Stack(
                children:[
                  Container(
                    height: size.height/3.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width/7.8),
                      color: Color(0xff8f94fb),
                    ),
                  ),
                  Container(
                    height: size.height/4.1,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      color: Color(0xff8f94fb),
                    ),
                  ),
                ]
              ),
              GridView.count(
                crossAxisCount: 2,
                children: [
                  SizedBox(),
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => TextRecognizer()));
                      },
                      child: Card(
                        elevation: 3.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children:[
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/ocr.png"),
                                radius:50
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Flexible(
                                  child: Text("OCR",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),)
                              )
                            ]
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async{
                        String codeScanner = await BarcodeScanner.scan();
                        setState(() {
                          qrCode = codeScanner;
                        });

                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            TextAreaWidget(title: "Scan QR Code",
                                text: qrCode,
                                onClickedCopy: copyToClipBoard,
                                onClickedClear: (){
                                  setState(() {
                                      qrCode= "";
                                   });
                                },)));
                            },
                      child: Card(
                        elevation: 3.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children:[
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/barcodeScanner.png"),
                                radius:50
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Flexible(
                                child: Text("QR & Barcode",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),)
                              )
                            ]
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
                )

              // Container(color: Colors.blue,)
            // ]
          // )
        ]
      ),
    );
  }

void copyToClipBoard(){
  if(qrCode.trim() != ''){
    FlutterClipboard.copy(qrCode);
  }
}
  void clear(){
    // setImage(Icon(Icons.photo));
    setQr('');
  }
  void setQr(String newQr){
    setState(() {
      qrCode = newQr;
    });
  }
}
