import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/choose-between-two.dart';
import 'package:wathiq/views/navbar/wathiq/required/required-details.dart';
import 'package:wathiq/widgets/button.dart';

class Wathiq extends StatelessWidget {
  Wathiq({super.key});
  RequiredDetailsController requiredDetailsController =
      Get.put(RequiredDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 3),
          Text(
            "Does the accident contain human casualties?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Radio(
                    value: "yes",
                    groupValue: requiredDetailsController.groub.value,
                    onChanged: (val) {
                      requiredDetailsController.groub.value = val as String;
                    },
                  ),
                  Text("YES"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "no",
                    groupValue: requiredDetailsController.groub.value,
                    onChanged: (val) {
                      requiredDetailsController.groub.value = val as String;
                      print(requiredDetailsController.groub.value);
                    },
                  ),
                  Text("NO"),
                ],
              )
            ],
          ),
          SizedBox(height: 100),
          if (requiredDetailsController.groub == "yes")
            Stack(
              clipBehavior: Clip.none,
              children: [
                ButtonWidget(
                  text: "Call 911",
                  color: Colors.red,
                  onPressed: () async {
                    await launchUrl(
                      Uri(scheme: 'tel', path: "911"),
                    );
                  },
                ),
                Positioned(
                    top: -25,
                    child:
                        Image.asset("assets/images/road_gov.png", width: 100)),
              ],
            )
          else if (requiredDetailsController.groub == "no")
            ButtonWidget(
              text: "New Accident Report",
              color: Colors.green,
              onPressed: () {
                Get.to(() => RequiredDetails());
                // Get.to(() => ChooseBetweenTwo());
              },
            )
          else
            Text(""),
        ],
      ),
    ));
  }
}
