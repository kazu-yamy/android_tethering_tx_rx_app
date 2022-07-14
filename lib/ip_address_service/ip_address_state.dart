import 'package:r_get_ip/r_get_ip.dart';

class IPAddressState {

  getExternalIP<String>() {

    dynamic externalIPAddress;

    try {
      externalIPAddress = RGetIp.externalIP;
    } catch (e) {
      externalIPAddress = "Unknown...";
    }

    return(externalIPAddress.toString());

  }

  getInternalIP<String>() {

    dynamic internalIPAddress;

    try {
      internalIPAddress = RGetIp.internalIP;
    } catch (e) {
      internalIPAddress = "Unknown...";
    }

    return(internalIPAddress.toString());

  }

  getNetworkType<String>() {

    dynamic networkType;

    try {
      networkType = RGetIp.networkType;
    } catch (e) {
      networkType = "Unknown...";
    }

    return(networkType.toString());

  }

}
