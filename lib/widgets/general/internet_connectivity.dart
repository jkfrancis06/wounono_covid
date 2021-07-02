
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:connectivity_widget/connectivity_widget.dart';



class InternetConnectivity extends StatefulWidget {

  @override
  _InternetConnectivityState createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {

  Stream<bool> isPhoneConnected =  ConnectivityUtils.instance.isPhoneConnectedStream;

  bool connectionStatus;

  final snackBar = SnackBar(
      content: Text(
          'No internet connection'
      ),
      backgroundColor: Colors.red,
    duration: Duration(seconds: 3600),
  );


  @override
  void initState() {
    super.initState();
    checkConnection();
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(''),
      ],
    );
  }

  checkConnection() async {
    isPhoneConnected.listen((event) {
      if(!event){
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
      print(event);
      setState(() => connectionStatus = event);
    });
  }






}

