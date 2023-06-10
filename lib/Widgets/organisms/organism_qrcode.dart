import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';


class OrganismQrCode extends StatefulWidget {
  const OrganismQrCode({super.key});

  @override
  State<OrganismQrCode> createState() => _OrganismQrCodeState();
}

class _OrganismQrCodeState extends State<OrganismQrCode> {

  String ticket = '';

  readQrCode() async{
    String code = await FlutterBarcodeScanner.scanBarcode("#FFFFFF", "cancel", false, ScanMode.QR);

    setState(() => ticket = code != '-1' ? code : 'Not validated');

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (ticket != '')
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              'Ticket: $ticket',
              style: TextStyle(fontSize: 20),

            ),
          ),
        Text("Validate the Pet Code",
          style: TextStyle(fontSize: 20),
        ),
        
        SizedBox(height: 10),
        ElevatedButton.icon(onPressed: readQrCode, icon: Icon(Icons.qr_code), label: Text('Validate')),
      ],
    );
  }
}