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
      'New Accident Reports, Easy and fast',
      'Wathiq allows the possibility of opening a crock without the need for the presence of the accident representative in the event that there are no human casualties',
    ),
    OnboardingInfo(
      'assets/images/two-truck.json',
      'Request assistance in the event of your vehicle breaking down',
      'Wathiq makes it possible to communicate with several truck drivers close to the accident area',
    ),
    OnboardingInfo(
      'assets/images/report-tick-mark.json',
      'Follow up on your incidents and reports',
      'Watheq enables you to inquire about current incidents and past incidents',
    )
  ];
}
