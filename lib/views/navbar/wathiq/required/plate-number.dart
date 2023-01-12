import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/wathiq-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/license-number.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class PlateNumber extends StatelessWidget {
  PlateNumber({super.key});

  WathiqController wathiqController = Get.find<WathiqController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    left: 65,
                    right: 170,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 2)
                          FocusScope.of(context).nextFocus();
                      },
                      onSaved: (val) {
                        wathiqController.PlateNumber1 = val;
                      },
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'less than 2';
                        } else if (value!.length < 2) return "less than 2";
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
                        wathiqController.PlateNumber2 = val;
                      },
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'less than 5';
                        } else if (value!.length < 5) return "less than 5";
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
                    left: 150,
                    right: 0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(flex: 1, child: Container()),
            ButtonWidget(
              text: "Continuo",
              color: AppColors.BLUE,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  wathiqController.PlateNumberAll.value =
                      wathiqController.PlateNumber1! +
                          "-" +
                          wathiqController.PlateNumber2!;
                  print(
                      "${wathiqController.PlateNumberAll} ${wathiqController.PlateNumber2}");
                  Get.to(() => LicenseNumber());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
