import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/license-number.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class PlateNumber extends StatelessWidget {
  PlateNumber({super.key});

  RequiredDetailsController requiredDetailsController =
      Get.find<RequiredDetailsController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(data: "Plate Number", bold: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Container()),
            TextWidget(
                data: "Enter Your Plate Car Number :", size: 22, bold: true),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset("assets/images/plate-number.png"),
                  Positioned(
                    top: 7,
                    left: MediaQuery.of(context).size.width * 0.2,
                    right: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 2)
                          FocusScope.of(context).nextFocus();
                      },
                      onSaved: (val) {
                        requiredDetailsController.PlateNumber1 = val;
                      },
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'less than 1';
                        } else if (value!.length < 1) return "less than 1";
                      },
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 25),
                    ),
                  ),
                  Positioned(
                    // ignore: sort_child_properties_last
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                      ],
                      onSaved: (val) {
                        requiredDetailsController.PlateNumber2 = val;
                      },
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'less than 1';
                        } else if (value!.length < 1) return "less than 1";
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 5,
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
                  requiredDetailsController.plateNumberAll.value =
                      requiredDetailsController.PlateNumber1! +
                          "-" +
                          requiredDetailsController.PlateNumber2!;
                  print(
                      "${requiredDetailsController.plateNumberAll} ${requiredDetailsController.PlateNumber2}");
                  Get.off(() => LicenseNumber());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
