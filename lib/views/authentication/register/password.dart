import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wathiq/controllers/register-controller.dart';
import 'package:wathiq/views/authentication/otp/phone-number-scereen.dart';
import 'package:wathiq/views/navbar/navbar.dart';
import 'package:wathiq/widgets/button.dart';
import '../../../constans.dart';

class Password extends StatelessWidget {
  Password({super.key});

  final _formKey = GlobalKey<FormState>();
  RegisterController registerController = Get.find<RegisterController>();

  String? pwd1;
  String? pwd2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BLUE,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // physics: RangeMaintainingScrollPhysics(),
        child: Column(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter your Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'password must contain at least eight characters, at least one number and both lower and uppercase letters and special characters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (newValue) {
                            pwd1 = newValue;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.password),
                          ),
                          validator: (value) {
                            pwd1 = value;
                            if (value != null && value.isEmpty) {
                              return 'Password cannot be empty';
                            } else if (!isValidPassword(value))
                              return "Check your password...";
                            // print(isValidPassword(value));
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 're-Enter Password',
                            prefixIcon: Icon(Icons.threesixty_outlined),
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 're-Password  cannot be empty';
                            } else if (pwd1 != value) return "Not The Same!";
                          },
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  text: "Continuo",
                  color: AppColors.BLUE,
                  width: MediaQuery.of(context).size.width * 0.8,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      registerController.CreateAccount(
                          registerController.NID!, pwd1!);
                      // registerController.getName();
                    }
                  },
                )
                //
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isValidPassword(val) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_]).{8,}$')
        .hasMatch(val);
  }
}
