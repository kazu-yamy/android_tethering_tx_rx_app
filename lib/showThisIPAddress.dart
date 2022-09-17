import 'package:flutter/material.dart';
import 'package:r_get_ip/r_get_ip.dart';

class ShowThisIPAddressPage extends StatefulWidget {
  const ShowThisIPAddressPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _ShowThisIPAddressPage();
}

class _ShowThisIPAddressPage extends State<ShowThisIPAddressPage> {

  String externalIP = "Searching...";
  String internalIP = "Searching...";
  String networkType = "Searching...";

  void _refresh() async {
    externalIP = await getExternalIP();
    internalIP = await getInternalIP();
    networkType = await getNetworkType();
    setState(() { });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
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
            Text('ExternalIP:$externalIP'),
            Text('InternalIP: $internalIP'),
            Text('Network: $networkType'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

//~~~~~Functions~~~~//
Future<String> getExternalIP() async {
  dynamic externalIP;
  try {
    externalIP = await RGetIp.externalIP;
  } catch (err) {
    externalIP = 'Unknown...';
  }
  return externalIP;
}

Future<String> getInternalIP() async {
  dynamic internalIP;
  try {
    internalIP = await RGetIp.internalIP;
  } catch (err) {
    internalIP = 'Unknown...';
  }
  return internalIP;
}

Future<String> getNetworkType() async {
  dynamic networkType;
  try {
    networkType = await RGetIp.networkType;
  } catch (err) {
    networkType = 'Unknown...';
  }
  return networkType;
}
