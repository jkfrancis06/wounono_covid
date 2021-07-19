import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:wounono_covid/utils/constants.dart';

import 'package:pin_input_text_field/pin_input_text_field.dart';

import 'package:otp_autofill/otp_autofill.dart';




class PinCodeVerificationScreen extends StatefulWidget {


  final String phoneNumber;

  PinCodeVerificationScreen({Key key, this.phoneNumber}) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {


  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";


  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _listenForCode();
    OTPInteractor.getAppSignature()
    //ignore: avoid_print
        .then((value) => print('signature - $value'));
  }

  @override
  void dispose() {
    super.dispose();
    SmsAutoFill().unregisterListener();
  }

  // snackBar Widget
  snackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    String _code="";
    String signature = "{{ app signature }}";


    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        body: GestureDetector(
          onTap: () {},
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 30),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: Text(
                    'Verification du numéro de téléphone',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "En attente du SMS envoyé à :  ",
                        children: [
                          TextSpan(
                              text: "${widget.phoneNumber}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style: TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: PinFieldAutoFill(
                    decoration: UnderlineDecoration(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black),
                      colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                    ),
                    currentCode: _code,
                    onCodeSubmitted: (code) {},
                    onCodeChanged: (code) {
                      print(code);
                      if (code.length == 6) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                  ),
                ),


                SizedBox(
                  height: 20,
                ),

                Text("App Signature : $signature"),
                SizedBox(height: 4.0),

                ElevatedButton(
                  child: Text('Get app signature'),
                  onPressed: () async {
                    signature = await SmsAutoFill().getAppSignature;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _listenForCode() async {
    await SmsAutoFill().listenForCode;
  }
}