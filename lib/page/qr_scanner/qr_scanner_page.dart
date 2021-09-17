import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScannerPage extends StatefulWidget {
  @override
  _QrScannerPageState createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  String? scanResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Qr Scanner Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    "#cccccc", "Cancel", true, ScanMode.DEFAULT);

                setState(() {
                  scanResult = barcodeScanRes;
                });
              },
              child: Text("Scan Now"),
            ),
            SizedBox(height: 16),
            Text("Scan Result: $scanResult"),
            if (scanResult != null) ...[
              SizedBox(height: 16),
              QrImage(
                data: scanResult!,
                version: QrVersions.auto,
                size: 200.0,
              )
            ],
          ],
        ),
      ),
    );
  }
}
