import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextWidget extends StatelessWidget {
  String data;
  double size;
  bool bold;

  TextWidget(
      {super.key, required this.data, this.size = 16, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: size,
        fontWeight: bold ? FontWeight.w900 : FontWeight.normal,
      ),
    );
  }
}
