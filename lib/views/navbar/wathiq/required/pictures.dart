import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/voice-record.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class Pictures extends StatelessWidget {
  Pictures({super.key});

  RequiredDetailsController requiredDetailsController =
      Get.find<RequiredDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(data: "Pictures", bold: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            TextWidget(data: "The four sides : ", bold: true, size: 24),
            SizedBox(height: 10),
            Obx(
              () => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: requiredDetailsController.listImage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        child: requiredDetailsController.listImage[index] ==
                                'assets/images/${index + 1}.png'
                            ? Image.asset(
                                requiredDetailsController.listImage[index],
                                fit: BoxFit.contain,
                              )
                            : Image.file(
                                requiredDetailsController.listImage[index]),
                      ),
                      Positioned(
                        right: -10,
                        top: -20,
                        child: IconButton(
                          onPressed: () {
                            requiredDetailsController.pickImage(index);
                          },
                          icon:
                              Image.asset("assets/images/plus.png", width: 20),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ButtonWidget(
              text: "Add the four sides by one CLICK",
              color: Colors.green,
              onPressed: () {
                requiredDetailsController.pickAllImage();
              },
            ),
            SizedBox(height: 40),
            TextWidget(data: "Damage Area & Road : ", bold: true, size: 24),
            SizedBox(height: 20),
            Obx(
              () => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: requiredDetailsController.listImage2.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        child: requiredDetailsController.listImage2[index] ==
                                'assets/images/damage.png'
                            ? Image.asset(
                                requiredDetailsController.listImage2[index],
                                fit: BoxFit.contain,
                              )
                            : Image.file(
                                requiredDetailsController.listImage2[index]),
                      ),
                      Positioned(
                        right: -10,
                        top: -20,
                        child: IconButton(
                          onPressed: () {
                            requiredDetailsController.pickImage2(index);
                          },
                          icon:
                              Image.asset("assets/images/plus.png", width: 20),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ButtonWidget(
              text: "Add Damage Area by one CLICK",
              color: Colors.green,
              onPressed: () {
                requiredDetailsController.pickAllImage2();
              },
            ),
            SizedBox(height: 40),
            ButtonWidget(
              text: "Continuo",
              color: AppColors.BLUE,
              onPressed: () {
                if (requiredDetailsController.checkallList())
                  Get.off(() => VoiceRecord());
              },
            ),
          ],
        ),
      ),
    );
  }
}
