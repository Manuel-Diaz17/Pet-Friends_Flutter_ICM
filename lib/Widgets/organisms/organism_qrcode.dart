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

    setState(() {
      if (code != '-1') {
        // Assuming the QR code format is "PET_CODE:PET_NAME" (e.g., "12345:Max")
        List<String> qrCodeData = code.split(':');
        if (qrCodeData.length == 2) {
          String petCode = qrCodeData[0];
          String petName = qrCodeData[1];
          // TODO: Validate the pet data against your database or predefined list
          // Example validation logic:
          if (petCode == '12345' && petName == 'Max') {
            ticket = 'Validated: $petCode:$petName';
          } else {
            ticket = 'Invalid pet data';
          }
        } else {
          ticket = 'Invalid QR code format';
        }
      } else {
        ticket = 'Not validated';
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Center( 
          child: Text(
            "Validate the Pet Code",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 20),
        Image.asset(
          'assets/images/pet_qrcode.png',
          height: 400,
          width: MediaQuery.of(context).size.width
        ),
        SizedBox(height: 100,),
        if (ticket != '')
          Padding(
            padding: EdgeInsets.only(bottom: 14.0),
            child: Text(
              'Ticket: $ticket',
              style: TextStyle(fontSize: 15),

            ),
          ),
        
        ElevatedButton.icon(onPressed: readQrCode, icon: Icon(Icons.qr_code), label: Text('Validate')),
      ],
    );
  }
}