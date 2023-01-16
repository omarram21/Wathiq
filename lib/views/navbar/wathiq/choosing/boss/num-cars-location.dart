import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/choose-two-controller.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/boss/generate-QR.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class NumOfCarsLocation extends StatelessWidget {
  NumOfCarsLocation({super.key});

  final chooseTwoControllers = Get.find<ChooseTwoControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextWidget(
              data: "Enter Number Of Cars That in the Accident",
              bold: true,
              size: 24,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (chooseTwoControllers.numOfCars.value > 2)
                        chooseTwoControllers.numOfCars.value--;
                    },
                  ),
                ),
                Obx(
                  () => TextWidget(
                      data: chooseTwoControllers.numOfCars.value.toString(),
                      bold: true,
                      size: 35),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (chooseTwoControllers.numOfCars.value < 6)
                        chooseTwoControllers.numOfCars.value++;
                    },
                  ),
                ),
              ],
            ),
            Obx(
              () => Container(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: chooseTwoControllers.numOfCars.value,
                  itemBuilder: (context, index) => Image.asset(
                    "assets/images/Car.png",
                    width: 50,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ButtonWidget(
              text: "Genrate QR Code",
              color: AppColors.BLUE,
              onPressed: () {
                chooseTwoControllers.randomNumber.value =
                    Random().nextInt(100000) + 100000;
                chooseTwoControllers.makeTheColliction();
                Get.to(() => GenerateQRCode());
              },
            )
          ],
        ),
      ),
    );
  }
}
