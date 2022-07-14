import 'package:android_tethering_tx_rx_app/ip_address_service/ip_address_state.dart';
import 'package:android_tethering_tx_rx_app/main.dart';
import 'package:flutter/material.dart';

class ShowIPState extends State<MyHomePage> {

  IPAddressState ipState = IPAddressState();
  dynamic externalIPAddress = "Searching...";
  dynamic internalIPAddress = "Searching...";
  dynamic networkType = "Searching...";

  @override
  void initState() async {
    super.initState();
    await wifiState();
  }

  wifiState() async {
    externalIPAddress = await ipState.getExternalIP();
    internalIPAddress = await ipState.getInternalIP();
    networkType = await ipState.getNetworkType();
    if(mounted) {
      setState(() {
        externalIPAddress;
        internalIPAddress;
        networkType;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    initState();

    return Scaffold(

      appBar: AppBar(
        title: const Text("IPアドレスの状態"),
      ),

      body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text(
                "externalIP: $externalIPAddress.",
                style: Theme.of(context).textTheme.headline5,
              ),

              Text(
                "internalIP: $internalIPAddress",
                style: Theme.of(context).textTheme.headline5,
              ),

              Text(
                "networkType: $networkType",
                style: Theme.of(context).textTheme.headline5,
              ),

            ],
          )
      ),
    );
  }
}