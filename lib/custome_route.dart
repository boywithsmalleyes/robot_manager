import 'package:flutter/material.dart';

class CustomeRoute extends PageRouteBuilder {
  final Widget widget;
  final int policy = 0;
  CustomeRoute(this.widget, policy)
      : super(
          transitionDuration: Duration(
            seconds: 1,
          ),
          pageBuilder: (context, animation1, animation2) {
            return widget;
          },
          transitionsBuilder: (context, animation1, animation2, child) {
            switch (policy) {
              //  渐隐渐现动画
              case 0:
                return FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
              case 1:
                // 缩放动画
                return ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1,
                    curve: Curves.linear,
                  )),
                  child: child,
                );
              case 2:
                // // 旋转动画
                return RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
              case 3:
                // 旋转加缩放
                return RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animation1, curve: Curves.fastOutSlowIn)),
                    child: child,
                  ),
                );
              case 4:
                // 左滑右出
                return SlideTransition(
                  position:
                      Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                          .animate(CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
            }
          },
        );
}
