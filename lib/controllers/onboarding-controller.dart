import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wathiq/views/authentication/choose-method.dart';

import '../models/onboarding-module.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.offAll(() => ChooseMethod());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      'assets/images/car-crash.json',
      'New Accident Reports,\n Easy and fast',
      'In the case that there are no human casualties, Wathiq permits for the opening of a crock without the presence of an accident representative.',
    ),
    OnboardingInfo(
      'assets/images/two-truck.json',
      'Request assistance when your vehicle breaking\n down',
      'Wathiq makes it possible to communicate with several truck drivers close to the accident area.',
    ),
    OnboardingInfo(
      'assets/images/report-tick-mark.json',
      'Keep track of your accidents and reports',
      'Wathiq enables you to inquire about current and previous accidents.',
    )
  ];
}
