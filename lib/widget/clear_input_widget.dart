import 'package:flutter/material.dart';

class ClearTextField extends StatefulWidget {
  final String labelText;
  final Widget leaderIcon;
  final bool isSecret;

  ClearTextField(this.labelText, this.leaderIcon, this.isSecret);

  @override
  _ClearTextFieldState createState() => _ClearTextFieldState();
}

class _ClearTextFieldState extends State<ClearTextField> {
  TextEditingController _controller;
  String _labelText = "";
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    _labelText = widget.labelText;
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _onTextChanged(String content) {
    setState(() {
      if (content != null) {
        isEmpty = false;
      } else {
        isEmpty = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("开始构建布局");
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset("assets/images/t_user.png"),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 0, 0, 18.0),
                child: TextField(
                  obscureText: widget.isSecret,
                  onChanged: _onTextChanged,
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: _labelText,
                  ),
                ),
              ),
              isEmpty ? _buildClearWidget() : null
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          Container(
            height: 1,
            color: Color.fromARGB(0, 1, 1, 1),
          ),
        ],
      ),
    );
  }

  Widget _buildClearWidget() {
    return GestureDetector(
      onTap: () {
        _controller.clear();
      },
      child: Image.asset("assets/images/icon_clear_text.png"),
    );
  }
}
