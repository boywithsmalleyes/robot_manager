

import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceUtil {

  Future<String> getDeviceBasic() async{
    var info = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isAndroid){
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('androidInfo: ${androidInfo.toString()}');
    } else{
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('iosInfo: ${iosInfo.toString()}');
    }
  }
}


