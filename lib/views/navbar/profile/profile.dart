import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/profile-controller.dart';
import 'package:wathiq/views/authentication/choose-method.dart';
import 'package:wathiq/views/navbar/navbar.dart';
import 'package:wathiq/views/navbar/profile/about.dart';
import 'package:wathiq/views/navbar/profile/account-information.dart';
import 'package:wathiq/views/navbar/profile/complations.dart';
import 'package:wathiq/views/navbar/profile/owned-vehicles.dart';
import 'package:wathiq/widgets/button.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  String message = '';

  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Welcome...",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  ButtonWidget(
                    text: "ACCOUNT INFORMATION",
                    color: AppColors.BLUE,
                    onPressed: () {
                      Get.to(() => AccountInformation());
                    },
                  ),
                  SizedBox(height: 15),
                  ButtonWidget(
                    text: "OWNED VEHICLES",
                    color: AppColors.BLUE,
                    onPressed: () {
                      Get.to(() => OwnedVehicles());
                    },
                  ),
                  SizedBox(height: 15),
                  ButtonWidget(
                    text: "About Wathiq",
                    color: AppColors.BLUE,
                    onPressed: () async {
                      Get.to(() => AboutWathiq());
                    },
                  ),
                  SizedBox(height: 15),
                  ButtonWidget(
                    text: "Complain or Suggestions",
                    color: AppColors.BLUE,
                    onPressed: () {
                      Get.to(() => Complaints());
                    },
                  ),
                  SizedBox(height: 15),
                  ButtonWidget(
                    text: "NEED HELP ?",
                    color: AppColors.BLUE,
                    onPressed: () async {
                      await launchUrl(
                          Uri(scheme: 'tel', path: "+962790000001"));
                    },
                  ),
                  SizedBox(height: 15),
                  ButtonWidget(
                    text: "Exit",
                    color: AppColors.RED,
                    onPressed: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.warning,
                        showCancelBtn: true,
                        title: 'are you sure you want to log out ?',
                        confirmBtnText: "YES",
                        // cancelBtnText: ,
                        // onCancelBtnTap: () {},
                        confirmBtnColor: Colors.red,
                        onConfirmBtnTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Get.offAll(() => ChooseMethod());
                          controller1.index = 0;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
