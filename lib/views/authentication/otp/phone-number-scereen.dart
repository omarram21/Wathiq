import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wathiq/views/authentication/otp/otp.dart';

import '../../../constans.dart';

class EnterPhoneNumber extends StatelessWidget {
  EnterPhoneNumber({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;

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
              'REGISTER',
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.BLUE),
              ),
              child: Stack(
                children: [
                  InternationalPhoneNumberInput(
                    initialValue: PhoneNumber(dialCode: '+962'),
                    onInputChanged: (PhoneNumber number) {
                      print('${number.dialCode} hey');
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: TextStyle(color: Colors.white),
                    textFieldController: controller,
                    formatInput: false,
                    maxLength: 9,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    cursorColor: Colors.white,
                    inputDecoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                      border: InputBorder.none,
                      hintText: 'Phone Number',
                      hintStyle:
                          TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    ),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                  Positioned(
                    left: 90,
                    top: 8,
                    bottom: 8,
                    child: Container(
                      height: 40,
                      width: 1,
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
                Get.to(() => Otp());
                Future.delayed(Duration(seconds: 2), () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Verificatoin()));
                });
              },
              color: AppColors.BLUE,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: _isLoading
                  ? Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
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
}
