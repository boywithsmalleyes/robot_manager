import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:robot_manager/pojo/common_param.dart';
import 'package:robot_manager/util/shared_preferenced.dart';

class DeviceUtil {
  Future<Object> getDeviceBasic() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo;
    } else {
      return null;
    }
  }

  Future<String> getDeviceImei() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await getDeviceBasic();
      return info.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo info = await getDeviceBasic();
      return info.identifierForVendor;
    } else {
      return null;
    }
  }

  Future<String> getDeviceMid() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await getDeviceBasic();
      return info.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo info = await getDeviceBasic();
      return info.identifierForVendor;
    } else {
      return null;
    }
  }

  Future<String> requestCommonParamter() async {
    CommonParam commonParam = CommonParam();

    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await getDeviceBasic();
      // commonParam = CommonParam(
      //     "v1.0.1",
      //     info.androidId,
      //     await SharedPrefenenceUtil.getStringData("userID"),
      //     info.androidId,
      //     '0',
      //     info.model,
      //     'Hachi',
      //     'Hachi');
      commonParam.ver ="v1.0.1";
      commonParam.userID = await SharedPrefenenceUtil.getStringData("userID");
      commonParam.imei = info.androidId;
      commonParam.mid = info.androidId;
      commonParam.platform = '0';
      commonParam.phoneModel = info.model;
      commonParam.channelID = 'Hachi';
      commonParam.channelName = 'Hachi';
      // print('llllllllllllllllllllllllll${json.encode(commonParam)}');
      return json.encode(commonParam.toJson());
    } else if (Platform.isIOS) {
      IosDeviceInfo info = await getDeviceBasic();
      return info.identifierForVendor;
    } else {
      return null;
    }
  }
}
