import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/choose-two-controller.dart';
import 'package:wathiq/widgets/text.dart';

class GenerateQRCode extends StatefulWidget {
  GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void dispose() {
    super.dispose();
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  final chooseTwoControllers = Get.find<ChooseTwoControllers>();

  // int randomNumber =;
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        chooseTwoControllers.checkForDocuments();
        chooseTwoControllers.randomNumber.value = 0;
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextWidget(data: chooseTwoControllers.randomNumber.toString()),
                TextWidget(
                  data:
                      "make all other cars scan this QR code to enter the filling screen",
                  bold: true,
                  size: 24,
                ),
                SizedBox(height: 50),
                QrImage(
                  data: 'wathiq' + chooseTwoControllers.randomNumber.toString(),
                  version: 3,
                  size: MediaQuery.of(context).size.width * 0.6,
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.BLUE,
                  // foregroundColor: Colors.black,
                  embeddedImage: AssetImage('assets/images/logo.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
