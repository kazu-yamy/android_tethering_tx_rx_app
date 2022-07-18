import 'package:r_get_ip/r_get_ip.dart';

Future<String> getExternalIP() async {

  dynamic externalIPAddress;

  try {
    externalIPAddress = await RGetIp.externalIP;
  } catch (e) {
    externalIPAddress = "Unknown...";
  }

  return Future<String>.value(externalIPAddress);

}

Future<String> getInternalIP() async {

  dynamic internalIPAddress;

  try {
    internalIPAddress = await RGetIp.internalIP;
  } catch (e) {
    internalIPAddress = "Unknown...";
  }

  return Future<String>.value(internalIPAddress);

}

Future<String> getNetworkType() async {

  dynamic networkType;

  try {
    networkType = await RGetIp.networkType;
  } catch (e) {
    networkType = "Unknown...";
  }

  return Future<String>.value(networkType);

}
