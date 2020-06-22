import 'dart:io';
import 'package:device_info/device_info.dart';

abstract class DeviceId {
   Future<String> getId();
}
class MyDeviceId implements DeviceId{
  Future<String> getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print(androidDeviceInfo.androidId.toString());
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}