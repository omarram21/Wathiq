import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/choose-two-controller.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class WaitingPage extends StatelessWidget {
  WaitingPage({super.key});
  final chooseTwoControllers = Get.find<ChooseTwoControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(data: "Please Wait The Other Users", bold: true),
          Lottie.asset("assets/images/Penulum Waiting.json"),
        ],
      ),
    ));
  }
}
