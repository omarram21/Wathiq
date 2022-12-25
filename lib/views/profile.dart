import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/views/authentication/choose-method.dart';
import 'package:wathiq/widgets/button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
                text: "Exit",
                color: AppColors.GRAY,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(() => ChooseMethod());
                })
          ],
        ),
      ),
    );
  }
}
