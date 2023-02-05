import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/wating-page.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget(data: "No Previous accident"),
        // ButtonWidget(
        //   text: "Wating",
        //   color: Colors.black,
        //   onPressed: () {
        //     Get.to(() => WaitingPage());
        //   },
      ),
    );
    // );
  }
}
