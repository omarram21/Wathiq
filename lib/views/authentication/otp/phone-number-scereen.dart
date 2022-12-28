import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wathiq/controllers/register-controller.dart';
import 'package:wathiq/views/authentication/otp/otp.dart';

import '../../../constans.dart';

class EnterPhoneNumber extends StatelessWidget {
  EnterPhoneNumber({Key? key}) : super(key: key);

  RegisterController registerController = Get.find<RegisterController>();
  final _formKey = GlobalKey<FormState>();
  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BLUE,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
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
                    Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            const Text(
              'Phone Number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: Text(
                'Enter your phone number to continu, we will send you OTP to verifiy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.BLUE),
              ),
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      bottom: 0,
                      // height: 0,
                      // right: 0,
                      child: Row(
                        children: [
                          Image.asset('assets/images/jordan.png', height: 40),
                          Text("   +962"),
                        ],
                      )),
                  Positioned(
                    right: 0,
                    left: 110,
                    bottom: -5,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(9),
                            FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                          ],
                          onSaved: (newValue) => phone = newValue,
                          onChanged: (value) {
                            phone = value;
                          }),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 8,
                    bottom: 8,
                    child: Container(
                      height: 40,
                      width: 2,
                      color: AppColors.BLUE,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 100),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width * 0.8,
              onPressed: () {
                print(phone);
                if (isValidPhone(phone)) {
                  _formKey.currentState!.save();
                  print(phone);
                  registerController.verifyPhone('+962${phone}');
                  Get.to(() => Otp());
                } else
                  Get.snackbar('incorrect phone number',
                      'Please fill your phone number');
              },
              color: AppColors.BLUE,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Text(
                "Request OTP",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  bool isValidPhone(val) {
    return RegExp(r'^7[987][0-9]{7}$').hasMatch(val);
  }
}
