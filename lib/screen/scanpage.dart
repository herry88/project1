import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScan extends StatefulWidget {
  const BarcodeScan({Key? key}) : super(key: key);

  @override
  State<BarcodeScan> createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  String _scanBarcode = 'Unknown';
  //function ScanQr
  Future<void> scanQr() async {
    String barcodeScan;
    //implementasi
    try {
      barcodeScan = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScan);
    } on PlatformException {
      barcodeScan = 'Failed Scan';
    }
    //jika widget barcodeScan tidak terisi
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScan;
    });
  }

  //barcodeORi
  Future<void> scanBarcodeOri() async {
    String barcodeScan;
    //implementasi
    try {
      barcodeScan = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScan);
    } on PlatformException {
      barcodeScan = 'Failed Scan';
    } on PlatformException {
      barcodeScan = 'Failed Scan';
    }

    setState(() {
      _scanBarcode = barcodeScan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scan'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => scanBarcodeOri(),
              child: Text('Scan Barcode'),
            ),
            ElevatedButton(
              onPressed: () => scanQr(),
              child: Text('Scan Qr'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Scan Result: $_scanBarcode',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
