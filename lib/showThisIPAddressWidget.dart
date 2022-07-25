import 'package:flutter/material.dart';
import 'package:r_get_ip/r_get_ip.dart';

class ShowThisIPAddressPage extends StatefulWidget {
  const ShowThisIPAddressPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _ShowThisIPAddressPage();
}

class _ShowThisIPAddressPage extends State<ShowThisIPAddressPage> {

  dynamic externalIP;
  dynamic internalIP;
  dynamic networkType;

  @override
  void initState() {
    super.initState();
  }

 void refreshIPAddress() {
    setState(() {
      externalIP = getExternalIP;
      internalIP = getInternalIP;
      networkType = getNetworkType;
    });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('This Device IP'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ExternalIP: $externalIP'),
            Text('InternalIP: $internalIP'),
            Text('Network: $networkType'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshIPAddress,
        tooltip: 'Refresh IP',
        child: const Text('Refresh'),
      ),
    );
  }

}

//~~~~~Functions~~~~//
getExternalIP<String>() async {
  dynamic externalIP;
  try {
    externalIP = await RGetIp.externalIP;
  } catch (e) {
    externalIP = 'Unknown...';
  }
  return externalIP;
}

getInternalIP<String>() async {
  dynamic internalIP;
  try {
    internalIP = await RGetIp.internalIP;
  } catch (e) {
    internalIP = 'Unknown...';
  }
  return internalIP;
}

getNetworkType<String>() async {
  dynamic networkType;
  try {
    networkType = await RGetIp.networkType;
  } catch (e) {
    networkType = 'Unknown...';
  }
  return networkType;
}
