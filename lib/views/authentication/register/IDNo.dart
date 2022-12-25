import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/views/authentication/otp/phone-number-scereen.dart';
import '../../../constans.dart';
import '../../../widgets/button.dart';

class IDNo extends StatelessWidget {
  IDNo({super.key});

  final _formKey = GlobalKey<FormState>();
  String? IDN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BLUE,
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Enter Your ID Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Enter your National number witch is consist of 10 digests and it\'s on front of your Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      // keyboardType: TextInputType.multiline,
                      maxLength: 8,
                      onSaved: (newValue) {
                        IDN = newValue;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[A-Z0-9]+"))
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_task_rounded),
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'ID number cannot be empty';
                        } else if (value!.length < 8)
                          return "cannot be less than 8 characters";
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ButtonWidget(
                  text: "Continuo",
                  color: AppColors.BLUE,
                  width: MediaQuery.of(context).size.width * 0.8,
                  onPressed: () {
                    if (_formKey.currentState!.validate())
                      _formKey.currentState!.save();
                    print(IDN);
                    Get.to(() => EnterPhoneNumber());
                  },
                )
                //
              ],
            ),
            // Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
