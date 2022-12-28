import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/profile-controller.dart';
import 'package:wathiq/views/authentication/choose-method.dart';
import 'package:wathiq/views/navbar/profile/account-information.dart';
import 'package:wathiq/views/navbar/profile/owned-vehicles.dart';
import 'package:wathiq/widgets/button.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

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
                  "Welcome Omar Ramadan...",
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
                    text: "NEED HELP ?",
                    color: AppColors.BLUE,
                    onPressed: () {},
                  ),
                  SizedBox(height: 15),
                  ButtonWidget(
                    text: "Exit",
                    color: AppColors.RED,
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(() => ChooseMethod());
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
