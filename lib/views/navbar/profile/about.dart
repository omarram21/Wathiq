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

class AboutWathiq extends StatelessWidget {
  AboutWathiq({super.key});
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Wathiq",
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
                    '"Life is short, and we should respect every moment of it." \n\n the proverb says. It is crucial for our country to stay up with the tremendous development and innovation occurring throughout the world.\n\nTraffic collisions cost the economy a lot of money, waste a lot of time, and sometimes even result in deaths.\n\n The "Wathiq" application was created to address this problem and take into consideration the various demands and conditions of all members of society who use the roadways. \n\n By cutting down on the time needed to gather information about an accident and assess the damage, it aims to save people\'s time and protect their lives.',
                bold: true,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
