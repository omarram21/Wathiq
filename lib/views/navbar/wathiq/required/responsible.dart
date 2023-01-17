import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/damage-area.dart';
import 'package:wathiq/views/navbar/wathiq/required/pictures.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class Responsible extends StatelessWidget {
  Responsible({super.key});
  RequiredDetailsController requiredDetailsController =
      Get.find<RequiredDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(data: "Responsibility", bold: true),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(flex: 1, child: Container()),
              TextWidget(
                  data: "Who is the responsible about the accident ? ",
                  size: 22,
                  bold: true),
              SizedBox(height: 20),
              Obx(
                () => ListTile(
                  tileColor:
                      requiredDetailsController.responsible.value == 'YES'
                          ? AppColors.BLUE
                          : null,
                  leading: Image.asset("assets/images/accept.png"),
                  title: TextWidget(data: "YES", bold: true),
                  subtitle: TextWidget(
                      data: "my Vehicle responsible for the accident",
                      size: 14),
                  onTap: () {
                    requiredDetailsController.responsible.value = 'YES';
                  },
                  enableFeedback: true,
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => ListTile(
                  tileColor: requiredDetailsController.responsible.value == 'NO'
                      ? AppColors.BLUE
                      : null,
                  leading: Image.asset("assets/images/cancel.png"),
                  title: TextWidget(data: "NO", bold: true),
                  subtitle: TextWidget(
                      data: "my Vehicle affected by the accident", size: 14),
                  onTap: () {
                    requiredDetailsController.responsible.value = 'NO';
                  },
                  enableFeedback: true,
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => ListTile(
                  tileColor:
                      requiredDetailsController.responsible.value == 'UnKnown'
                          ? AppColors.BLUE
                          : null,
                  leading: Image.asset("assets/images/question.png"),
                  title: TextWidget(data: "UnKnown", bold: true),
                  subtitle: TextWidget(data: "liability is unknown", size: 14),
                  onTap: () {
                    requiredDetailsController.responsible.value = 'UnKnown';
                  },
                  enableFeedback: true,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              ButtonWidget(
                text: "Continuo",
                color: AppColors.BLUE,
                onPressed: () {
                  Get.off(() => DamageArea());
                  print(requiredDetailsController.responsible.value);
                },
              )
            ],
          ),
        ));
  }
}
