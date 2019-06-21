import 'package:flutter/material.dart';
import 'package:robot_manager/account/user_login.dart';
import 'package:robot_manager/custome_route.dart';
import 'package:robot_manager/main_page.dart';
import 'package:robot_manager/util/shared_preferenced.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  bool isLogin = false;

  void _initData() async {
    isLogin = await SharedPrefenenceUtil.getBoolData("isLogin");
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds:3),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      print('$status');
      print('$isLogin');
      if (status == AnimationStatus.completed) {
        if (isLogin) {
          Navigator.pushAndRemoveUntil(
              context, CustomeRoute(MainPage(), 1), (router) => router == null);
        } else {
          Navigator.pushAndRemoveUntil(context,
              CustomeRoute(UserLoginPage(), 1), (router) => router == null);
        }
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Image.asset(
          "assets/images/bg_splash.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
