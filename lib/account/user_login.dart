import 'package:flutter/material.dart';

class UserLoginPage extends StatefulWidget {
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController _controller;

  FocusNode focusNode1 = FocusNode();


  var userName;
  var userPassword;

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
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: 80.0,
              child: Row(
                children: <Widget>[
                  // Image.asset("assets/images/t_user.png"),
                  TextField(
                    controller: _controller,
                    autofocus: true,
                    focusNode: focusNode1,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
