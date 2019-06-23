import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:robot_manager/network/dio_util.dart';
import 'package:robot_manager/util/device_info_util.dart';
import 'package:robot_manager/util/toast_util.dart';
import 'dart:convert';

class UserLoginPage extends StatefulWidget {
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController _pwdController;
  TextEditingController _nameController;

  FocusNode nameFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();

  var userName;
  var userPassword;

  bool isShowNameClear = false;
  bool isShowPwdClear = false;

  @override
  void initState() {
    super.initState();
    _pwdController = TextEditingController();
    _nameController = TextEditingController();

    _nameController.addListener(() {
      setState(() {
        isShowNameClear = _isShow(_nameController.text, nameFocus);
      });
    });

    _pwdController.addListener(() {
      setState(() {
        isShowPwdClear = _isShow(_pwdController.text, pwdFocus);
      });
    });
    pwdFocus.addListener(() {
      setState(() {
        isShowPwdClear = _pwdController.text.length > 0 && pwdFocus.hasFocus;
      });
    });

    nameFocus.addListener(() {
      setState(() {
        isShowNameClear = _isShow(_nameController.text, nameFocus);
      });
    });
  }

  bool _isShow(String content, FocusNode focus) {
    return content.length > 0 && focus.hasFocus;
  }

  _login() async {
    Map<String, dynamic> param = Map();
    param['userName'] = _nameController.text.toString();
    param['userPwd'] = _pwdController.text.toString();
    param['imei'] = await DeviceUtil().getDeviceImei();
    param['mid'] = await DeviceUtil().getDeviceMid();
    String response = await DioUtil().post("/login", param);
    final jsonMap = json.decode(response);
    print('Login response: ${jsonMap['msg']}');
    ToastUtil().showToast(context, '${jsonMap['msg']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 0.3,
        title: Text(
          '登录',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 34, 30, 0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              autofocus: true,
              focusNode: nameFocus,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.account_circle),
                hintText: '请输入用户名',
                hintStyle: TextStyle(
                  fontSize: 15,
                ),
                suffixIcon: isShowNameClear
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        alignment: Alignment.center,
                        onPressed: () {
                          _nameController.clear();
                        },
                      )
                    : null,
              ),
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
            ),
            Divider(),
            TextField(
              controller: _pwdController,
              obscureText: true,
              focusNode: pwdFocus,
              decoration: InputDecoration(
                hintText: "请输入密码",
                border: InputBorder.none,
                icon: Icon(
                  Icons.lock,
                ),
                suffixIcon: isShowPwdClear
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        alignment: Alignment.center,
                        onPressed: () {
                          _pwdController.clear();
                        })
                    : null,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  colorBrightness: Brightness.dark,
                  color: Colors.black,
                  highlightColor: Colors.grey,
                  splashColor: null,
                  child: Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  onPressed: () {
                    _login();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
