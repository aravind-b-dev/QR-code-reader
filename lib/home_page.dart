

import 'package:barcode_scan/model/scan_options.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String qrData = "No data found!";
  var data;
  bool hasdata = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: const Text("QR Code Reader"
        ),
        centerTitle: true,
      ),
      body:
       Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Lottie.asset("assets/lottie/68692-qr-code-scanner.json",width: 155),
                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Contents:  ${(qrData)}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.launch_outlined,color: Colors.teal.shade900,),
                      onPressed: hasdata
                          ? () async {
                        if (await canLaunch(qrData)) {
                          print(qrData);
                          await launch(qrData);
                        } else {
                          throw 'Could not launch ';
                        }
                      }
                          : null,
                    ),
                  ],
                ),
                SizedBox(height: 25,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  onPressed: () async {
                    var options = const ScanOptions(
                      autoEnableFlash: false,
                    );
                    var data = await BarcodeScanner.scan(options: options);
                    setState(() {
                      qrData = data.rawContent.toString();
                      hasdata = true;
                    });
                  },
                  child: Text('Scan QR'),
                ),


                SizedBox(height: 25,)
              ],
            ),
      ),
    );
  }
}
