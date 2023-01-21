import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wathiq/controllers/register-controller.dart';
import 'package:wathiq/views/authentication/otp/phone-number-scereen.dart';
import 'package:wathiq/views/navbar/navbar.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextWidget(data: "5/5", bold: true),
          )
        ],
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
                  'Create password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'must be eight characters, contain at least :\n - one number\n - one lower and uppercase letters \n - one special characters (@#\${%^&*})',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
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
                        Obx(
                          () => TextFormField(
                            onSaved: (newValue) {
                              pwd1 = newValue;
                            },
                            obscureText: registerController.isHidden1.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                child: registerController.isHidden1.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye),
                                onTap: () {
                                  registerController.isHidden1.value =
                                      !registerController.isHidden1.value;
                                },
                              ),
                            ),
                            validator: (value) {
                              pwd1 = value;
                              if (value != null && value.isEmpty) {
                                return 'Password cannot be empty';
                              } else if (!isValidPassword(value))
                                return "follow the entry conditions";
                              // print(isValidPassword(value));
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => TextFormField(
                            obscureText: registerController.isHidden2.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 're-Enter Password',
                              prefixIcon: Icon(Icons.threesixty_outlined),
                              suffixIcon: GestureDetector(
                                child: registerController.isHidden2.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye),
                                onTap: () {
                                  registerController.isHidden2.value =
                                      !registerController.isHidden2.value;
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 're-Password  cannot be empty';
                              } else if (pwd1 != value) return "Not The Same!";
                            },
                          ),
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
                ),
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
