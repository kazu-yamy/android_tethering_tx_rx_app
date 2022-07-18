import 'package:android_tethering_tx_rx_app/ip_address_service/ip_address_state.dart';
import 'package:flutter/material.dart';

class ShowIPState extends StatefulWidget {
  const ShowIPState({Key? key}) : super(key: key);

  @override
  State<ShowIPState> createState() =>  _ShowIPState();

}

dynamic externalIPAddress = "Searching...";
dynamic  internalIPAddress = "Searching...";
dynamic networkType = "Searching...";

class _ShowIPState extends State<ShowIPState> {

  @override
  void initState() {
    super.initState();
    externalIPAddress = getExternalIP();
    internalIPAddress = getInternalIP();
    networkType = getNetworkType();
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