
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

  @override
  void initState() {
    super.initState();
    checkConnection();
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(' Status: $connectionStatus'),
      ],
    );
  }

  checkConnection() async {
    isPhoneConnected.listen((event) {
      print(event);
      setState(() => connectionStatus = event);
    });
  }






}

