import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wathiq/controllers/wathiq-controller.dart';
import 'package:wathiq/views/navbar/profile/profile.dart';
import 'package:wathiq/views/navbar/wathiq/required-details.dart';
import 'package:wathiq/widgets/button.dart';

class Wathiq extends StatelessWidget {
  Wathiq({super.key});
  WathiqController wathiqController = Get.put(WathiqController());

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
                    groupValue: wathiqController.groub.value,
                    onChanged: (val) {
                      wathiqController.groub.value = val as String;
                    },
                  ),
                  Text("YES"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "no",
                    groupValue: wathiqController.groub.value,
                    onChanged: (val) {
                      wathiqController.groub.value = val as String;
                      print(wathiqController.groub.value);
                    },
                  ),
                  Text("NO"),
                ],
              )
            ],
          ),
          SizedBox(height: 100),
          if (wathiqController.groub == "yes")
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
          else if (wathiqController.groub == "no")
            ButtonWidget(
              text: "New Accident Report",
              color: Colors.green,
              onPressed: () {
                Get.to(() => RequiredDetails());
              },
            )
          else
            Text(""),
        ],
      ),
    ));
  }
}
