import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/register-controller.dart';
import 'package:wathiq/views/authentication/SignIn/sign-in.dart';
import 'package:wathiq/views/authentication/register/national-number.dart';
import 'package:wathiq/views/navbar/navbar.dart';
import 'package:wathiq/widgets/button.dart';

class ChooseMethod extends StatelessWidget {
  ChooseMethod({super.key});

  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              // border: Border.all(width: 10, color: AppColors.BLUE),
              color: AppColors.BLUE,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/logo.png"),
                  Image.asset("assets/images/fast.png"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                    text: "Login",
                    color: AppColors.GRAY,
                    width: 200,
                    onPressed: () {
                      Get.to(() => SignIn());
                    }),
                ButtonWidget(
                    text: "Register",
                    color: AppColors.GRAY,
                    width: 200,
                    onPressed: () {
                      Get.to(() => NationalNumber());
                    }),
                ButtonWidget(
                    text: "HomePage",
                    color: AppColors.BLUE,
                    onPressed: () {
                      // Get.offAll(() => NavBar());
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
