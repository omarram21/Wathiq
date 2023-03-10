import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/responsible.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class LicenseNumber extends StatelessWidget {
  LicenseNumber({super.key});

  RequiredDetailsController requiredDetailsController =
      Get.find<RequiredDetailsController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(data: "License Number", bold: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Container()),
            TextWidget(
                data: "Enter Your License Number :", size: 22, bold: true),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset("assets/images/jordan-driving-licence.png"),
                  Positioned(
                    // ignore: sort_child_properties_last
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                      ],
                      onSaved: (val) {
                        requiredDetailsController.license.value = val!;
                      },
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'less than 8';
                        } else if (value!.length < 8) return "less than 8";
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 25),
                    ),
                    top: 7,
                    left: MediaQuery.of(context).size.width * 0.4,
                    right: 0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(flex: 1, child: Container()),
            ButtonWidget(
              text: "Continue",
              color: AppColors.BLUE,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print("${requiredDetailsController.license}");
                  Get.off(() => Responsible());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
