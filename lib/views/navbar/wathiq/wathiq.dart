import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/controllers/tempcontroller.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/choose-between-two.dart';
import 'package:wathiq/views/navbar/wathiq/required/required-details.dart';
import 'package:wathiq/widgets/button.dart';

import '../../../controllers/choose-two-controller.dart';

class Wathiq extends StatelessWidget {
  Wathiq({super.key});
  TempController tempController = Get.put(TempController());

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
                    groupValue: tempController.groub.value,
                    onChanged: (val) {
                      tempController.groub.value = val as String;
                    },
                  ),
                  Text("YES"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "no",
                    groupValue: tempController.groub.value,
                    onChanged: (val) {
                      tempController.groub.value = val as String;
                      print(tempController.groub.value);
                    },
                  ),
                  Text("NO"),
                ],
              )
            ],
          ),
          SizedBox(height: 100),
          if (tempController.groub == "yes")
            ButtonWidget(
              text: "Call 911",
              color: Colors.red,
              onPressed: () async {
                await launchUrl(
                  Uri(scheme: 'tel', path: "911"),
                );
              },
            )
          else if (tempController.groub == "no")
            ButtonWidget(
              text: "New Accident Report",
              color: Colors.green,
              onPressed: () {
                // Get.to(() => RequiredDetails());
                Get.to(() => ChooseBetweenTwo());
              },
            )
          else
            Text(""),
        ],
      ),
    ));
  }
}
