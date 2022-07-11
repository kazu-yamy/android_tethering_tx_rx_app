import 'package:android_tethering_tx_rx_app/ip_address_service/ip_address_state.dart';
import 'package:android_tethering_tx_rx_app/main.dart';
import 'package:flutter/material.dart';

@override
class _ShowIPState extends State<MyHomePage> {
  IPAddressState IPState = IPAddressState();
  dynamic externalIPAddress = "Unknown...";
  dynamic internalIPAddress = "Unknown...";
  dynamic networkType = "Unknown...";

  @override
  void initState() {
    super.initState();
    wifiState();
  }

  Future<void> wifiState() async {
    externalIPAddress = await IPState.getExternalIP();
    internalIPAddress = await IPState.getInternalIP();
    networkType = await IPState.getNetworkType();
    setState(() {
      externalIPAddress;
      internalIPAddress;
      networkType;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("IPアドレスの状態"),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              "externalIP: $externalIPAddress",
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