import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/wathiq-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/license-number.dart';
import 'package:wathiq/views/navbar/wathiq/required/pictures.dart';
import 'package:wathiq/views/navbar/wathiq/required/plate-number.dart';
import 'package:wathiq/views/navbar/wathiq/required/responsible.dart';
import 'package:wathiq/views/navbar/wathiq/required/voice-record.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class RequiredDetails extends StatelessWidget {
  RequiredDetails({super.key});
  WathiqController wathiqController = Get.find<WathiqController>();

  String Who = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 100),
            Card(
              color: AppColors.BLUE,
              child: ListTile(
                leading: Image.asset("assets/images/license-plate.png"),
                title: TextWidget(data: "Plate Number", bold: true),
                subtitle: Obx(() => TextWidget(
                    data: wathiqController.PlateNumberAll.value, bold: true)),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => Get.to(() => PlateNumber()),
              ),
            ),
            // SizedBox(height: 20),
            Card(
              color: AppColors.BLUE,
              child: ListTile(
                leading: Image.asset("assets/images/driving-license.png"),
                title: TextWidget(data: "License Number", bold: true),
                subtitle: Obx(() => TextWidget(
                    data: wathiqController.license.value, bold: true)),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => Get.to(() => LicenseNumber()),
              ),
            ),
            Card(
              color: AppColors.BLUE,
              child: ListTile(
                leading: Image.asset("assets/images/hand.png"),
                title: TextWidget(data: "Responsible", bold: true),
                subtitle: Obx(() => TextWidget(
                    data: wathiqController.responsible.value, bold: true)),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => Get.to(() => Responsible()),
              ),
            ),
            Card(
              color: AppColors.BLUE,
              child: ListTile(
                leading: Image.asset("assets/images/camera.png"),
                title: TextWidget(data: "Pictures of Accident", bold: true),
                subtitle: Obx(() => TextWidget(
                    data: wathiqController.responsible.value, bold: true)),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => Get.to(() => Pictures()),
              ),
            ),
            Card(
              color: AppColors.BLUE,
              child: ListTile(
                leading: Image.asset("assets/images/voice-search.png"),
                title: TextWidget(data: "Voice Record", bold: true),
                subtitle: Obx(() => TextWidget(
                    data: wathiqController.responsible.value, bold: true)),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => Get.to(() => VoiceRecord()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
