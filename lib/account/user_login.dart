import 'package:flutter/material.dart';

class UserLoginPage extends StatefulWidget {
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController _controller;

  var userName;
  var userPassword;

  _userNameInputChange(content) {
    if (content != null) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '登录',
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset("assets/images/t_user.png"),
              TextField(
                decoration: InputDecoration(hintText: "请输入密码"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
