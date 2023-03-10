import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wathiq/controllers/register-controller.dart';
import 'package:wathiq/widgets/button.dart';
import '../../../constans.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  // RegisterController registerController = Get.find<RegisterController>();
  RegisterController registerController = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();
  String? nationalNumber;
  String? password;
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
                Form(
                  key: _formKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Your National Number",
                                style: TextStyle(fontWeight: FontWeight.w900))),
                        SizedBox(height: 10),
                        TextFormField(
                          key: Key("National-number"),
                          onSaved: (newValue) {
                            nationalNumber = newValue;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'National Number',
                            prefixIcon: Icon(Icons.person),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                          ],
                          maxLength: 10,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'please enter your National number';
                            } else if (value!.length < 10)
                              return "invalid national number";
                          },
                          // obscureText: true,
                        ),
                        SizedBox(height: 1),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Your Password",
                                style: TextStyle(fontWeight: FontWeight.w900))),
                        SizedBox(height: 10),
                        Obx(
                          () => TextFormField(
                            key: Key("Password"),
                            onSaved: (newValue) {
                              password = newValue;
                            },
                            obscureText: registerController.isHidden3.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                child: registerController.isHidden3.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye),
                                onTap: () {
                                  registerController.isHidden3.value =
                                      !registerController.isHidden3.value;
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'cannot be empty';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ButtonWidget(
                  key: Key("SignIn"),
                  text: "SignIn",
                  color: AppColors.BLUE,
                  width: MediaQuery.of(context).size.width * 0.8,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // print(nationalNumber);
                      // print(password);
                      registerController.SignIn(nationalNumber!, password!);
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
