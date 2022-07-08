import 'package:r_get_ip/r_get_ip.dart';

class IPAddressState {

  getExternalIP<String>() async {

    dynamic externalIPAddress;

    try {
      externalIPAddress = await RGetIp.externalIP;
    } catch (e) {
      externalIPAddress = "Unknown...";
    }

    return(externalIPAddress.toString());

  }

  getInternalIP<String>() async {

    dynamic internalIPAddress;

    try {
      internalIPAddress = await RGetIp.internalIP;
    } catch (e) {
      internalIPAddress = "Unknown...";
    }

    return(internalIPAddress.toString());

  }

  getNetworkType<String>() async {

    dynamic networkType;

    try {
      networkType = await RGetIp.networkType;
    } catch (e) {
      networkType = "Unknown...";
    }

    return(networkType.toString());

  }

}
