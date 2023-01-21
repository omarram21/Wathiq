import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/pictures.dart';
import 'package:wathiq/views/navbar/wathiq/required/responsible.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class DamageArea extends StatelessWidget {
  DamageArea({super.key});

  RequiredDetailsController requiredDetailsController =
      Get.find<RequiredDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(data: "Damage Area", bold: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Image.asset("assets/images/damageArea.png"),
            SizedBox(height: 20),
            TextWidget(
              data: "Enter the Damage area based on the above photo",
              size: 22,
              bold: true,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 17,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      TextWidget(data: (index + 1).toString()),
                      Obx(
                        () => Checkbox(
                          fillColor: MaterialStateProperty.all(AppColors.BLUE),
                          value: requiredDetailsController.chickList[index],
                          onChanged: (value) {
                            requiredDetailsController.chickList[index] = value;
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Expanded(flex: 1, child: Container()),
            ButtonWidget(
              text: "Continue",
              color: AppColors.BLUE,
              onPressed: () {
                print(requiredDetailsController.chickList.value);
                Get.off(() => Pictures());
              },
            )
          ],
        ),
      ),
    );
  }
}
