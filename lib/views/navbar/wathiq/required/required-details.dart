import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sn_progress_dialog/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/damage-area.dart';
import 'package:wathiq/views/navbar/wathiq/required/license-number.dart';
import 'package:wathiq/views/navbar/wathiq/required/pictures.dart';
import 'package:wathiq/views/navbar/wathiq/required/plate-number.dart';
import 'package:wathiq/views/navbar/wathiq/required/responsible.dart';
import 'package:wathiq/views/navbar/wathiq/required/voice-record.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

import '../../navbar.dart';

class RequiredDetails extends StatelessWidget {
  RequiredDetails({super.key});

  RequiredDetailsController requiredDetailsController =
      Get.find<RequiredDetailsController>();
  String accidentNum = Get.arguments;
  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context: context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(30),
                // alignment: Alignment.center,
                child: TextWidget(
                  data: 'Fill all the required information',
                  bold: true,
                  size: 24,
                ),
              ),
              // SizedBox(height: 20),
              Card(
                color: AppColors.BLUE,
                child: ListTile(
                  leading: Image.asset("assets/images/license-plate.png"),
                  title: TextWidget(data: "Plate Number", bold: true),
                  subtitle: Obx(() => TextWidget(
                      data: requiredDetailsController.plateNumberAll.value,
                      bold: true)),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        requiredDetailsController.plateNumberAll.value.isEmpty
                            ? const Icon(
                                Icons.crop_square,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.check_box_outlined,
                                color: Colors.green,
                              ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
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
                      data: requiredDetailsController.license.value,
                      bold: true)),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        requiredDetailsController.license.value.isEmpty
                            ? const Icon(
                                Icons.crop_square,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.check_box_outlined,
                                color: Colors.green,
                              ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  onTap: () => Get.to(() => LicenseNumber()),
                ),
              ),
              Card(
                color: AppColors.BLUE,
                child: ListTile(
                  leading: Image.asset("assets/images/hand.png"),
                  title: TextWidget(data: "Responsible", bold: true),
                  subtitle: Obx(() => TextWidget(
                      data: requiredDetailsController.responsible.value,
                      bold: true)),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        requiredDetailsController.responsible.value.isEmpty
                            ? const Icon(
                                Icons.crop_square,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.check_box_outlined,
                                color: Colors.green,
                              ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  onTap: () => Get.to(() => Responsible()),
                ),
              ),
              Card(
                color: AppColors.BLUE,
                child: ListTile(
                  leading: Icon(
                    Icons.car_crash_outlined,
                    size: 50,
                  ),
                  title: TextWidget(data: "Damage Area", bold: true),
                  subtitle: TextWidget(data: '', bold: true),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        requiredDetailsController.IsChickList.value == false
                            ? const Icon(
                                Icons.crop_square,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.check_box_outlined,
                                color: Colors.green,
                              ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  onTap: () => Get.to(() => DamageArea()),
                ),
              ),
              Card(
                color: AppColors.BLUE,
                child: ListTile(
                  leading: Image.asset("assets/images/camera.png"),
                  title: TextWidget(data: "Pictures of Accident", bold: true),
                  subtitle: Obx(() =>
                      requiredDetailsController.okImages.value == true
                          ? Text('done')
                          : Text('')),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        requiredDetailsController.okImages.value == false
                            ? const Icon(
                                Icons.crop_square,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.check_box_outlined,
                                color: Colors.green,
                              ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  onTap: () => Get.to(() => Pictures()),
                ),
              ),
              Card(
                color: AppColors.BLUE,
                child: ListTile(
                  leading: Image.asset("assets/images/voice-search.png"),
                  title: TextWidget(data: "Voice Record", bold: true),
                  subtitle: Obx(() => TextWidget(
                      data: requiredDetailsController.audioDuration.value ==
                              "00:00"
                          ? "done "
                          : requiredDetailsController.audioDuration.value,
                      bold: true)),
                  trailing: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        requiredDetailsController.audioDuration.value.isEmpty
                            ? const Icon(
                                Icons.crop_square,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.check_box_outlined,
                                color: Colors.green,
                              ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  onTap: () => Get.to(() => VoiceRecord()),
                ),
              ),
              SizedBox(height: 30),
              ButtonWidget(
                text: "Sent Accident Report",
                color: Colors.green,
                onPressed: () async {
                  bool x = await requiredDetailsController.sentAccidentReport(
                      accidentNum, context);
                  if (x) {
                    controller1.index = 0;
                    Get.offAll(() => NavBar());
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Completed Successfully!',
                    );
                  } else {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      title: 'Oops...',
                      text: 'pease fill all the required data',
                      confirmBtnColor: AppColors.BLUE,
                    );
                  }
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
