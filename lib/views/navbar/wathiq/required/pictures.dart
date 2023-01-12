import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wathiq/controllers/wathiq-controller.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class Pictures extends StatelessWidget {
  Pictures({super.key});

  WathiqController wathiqController = Get.find<WathiqController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            TextWidget(data: "Sides Photos : ", bold: true, size: 30),
            Obx(
              () => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: wathiqController.listImage.length,
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
                        child: wathiqController.listImage[index] ==
                                'assets/images/image.png'
                            ? Image.asset(
                                wathiqController.listImage[index],
                                fit: BoxFit.contain,
                              )
                            : Image.file(wathiqController.listImage[index]),
                      ),
                      Positioned(
                        right: -10,
                        top: -20,
                        child: IconButton(
                          onPressed: () {
                            wathiqController.pickImage(index);
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
              text: "add all",
              color: Colors.green,
              onPressed: () {
                wathiqController.pickAllImage();
              },
            ),
            Obx(
              () => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: wathiqController.listImage2.length,
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
                        child: wathiqController.listImage2[index] ==
                                'assets/images/image.png'
                            ? Image.asset(
                                wathiqController.listImage2[index],
                                fit: BoxFit.contain,
                              )
                            : Image.file(wathiqController.listImage2[index]),
                      ),
                      Positioned(
                        right: -10,
                        top: -20,
                        child: IconButton(
                          onPressed: () {
                            wathiqController.pickImage(index);
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
              text: "Hello",
              color: Colors.green,
              onPressed: () {
                wathiqController.pickAllImage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
