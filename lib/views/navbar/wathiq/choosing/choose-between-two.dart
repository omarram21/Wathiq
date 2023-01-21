import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/choose-two-controller.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/boss/generate-QR.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/boss/num-cars-location.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/scanner-QR.dart';
import 'package:wathiq/views/navbar/wathiq/required/required-details.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class ChooseBetweenTwo extends StatelessWidget {
  ChooseBetweenTwo({super.key});

  final chooseTwoControllers = Get.find<ChooseTwoControllers>();
  final requiredDetailsController = Get.put(RequiredDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => !chooseTwoControllers.isdone.value
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                              data: "Create New Accident Report : ",
                              bold: true),
                          SizedBox(height: 25),
                          ButtonWidget(
                            text: "Genrate QR code",
                            color: Colors.green,
                            onPressed: () {
                              Get.to(() => NumOfCarsLocation());
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                              data: "Join Existing Accident Report : ",
                              bold: true),
                          SizedBox(height: 25),
                          ButtonWidget(
                            text: "Scan QR Code ",
                            color: AppColors.BLUE,
                            onPressed: () {
                              Get.to(() => ScannerQRCode());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
