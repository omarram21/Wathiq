import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/profile-controller.dart';
import 'package:wathiq/widgets/button.dart';

import '../navbar.dart';

class AccountInformation extends StatelessWidget {
  AccountInformation({super.key});
  ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ACCOUNT INFORMATION",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(75.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.white,
                width: 1.0,
              ))),
              child: Text(
                profileController.users.name,
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "National Number",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.white,
                width: 1.0,
              ))),
              child: Text(
                profileController.users.nationalNumber,
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Phone Number",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.white,
                width: 1.0,
              ))),
              child: Text(
                profileController.users.phone!,
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "License Number",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.white,
                width: 1.0,
              ))),
              child: Text(
                profileController.users.licenseNumber,
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "License End Date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.white,
                width: 1.0,
              ))),
              child: Text(
                profileController.users.licenseEndDate,
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 100),
            ButtonWidget(
                text: 'Delete Account',
                color: AppColors.RED,
                onPressed: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.warning,
                    showCancelBtn: true,
                    title: 'are you sure you want delete your account ?',
                    confirmBtnText: "Sure",
                    confirmBtnColor: Colors.red,
                    onConfirmBtnTap: () async {
                      profileController.deleteAccount();
                      controller1.index = 0;
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
