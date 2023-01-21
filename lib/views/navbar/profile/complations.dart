import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

import '../../../controllers/profile-controller.dart';

class Complaints extends StatelessWidget {
  Complaints({super.key});
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Complaints or Suggestions",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget(
                data:
                    "if you have any Complaints or Suggestions, we are happy to hear from you",
                bold: true,
                size: 22,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _textController,
                  minLines: 10,
                  maxLines: 11,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "add it here...",
                    border: OutlineInputBorder(),

                    // prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'pleas add some world before continue';
                    }
                  },
                  onSaved: (newValue) {
                    profileController.ComplaintsOrSuggestions = newValue!;
                  },
                ),
              ),
              SizedBox(height: 200),
              // Expanded(child: Container()),
              ButtonWidget(
                text: "Submit",
                color: AppColors.BLUE,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _textController.clear();
                    _formKey.currentState!.save();
                    profileController.addToFireeBaseComplaintsOrSuggestions();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
