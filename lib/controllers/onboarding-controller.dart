import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wathiq/views/home.dart';
import '../models/onboarding-module.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.offAll(() => Home());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        'assets/images/crash.gif',
        'فتح طلب حادث جديد\n بسرعة و سهولة',
        'يتيح وثِّقها امكانية فتح كروكا دون الحاجة لتواجد مندوب الحوادث في حال لم يكن هنالك إصابات بشرية '),
    OnboardingInfo(
        'assets/images/tows-car.gif',
        'طلب المساعدة في حال تعطل مركبتك عن العمل',
        'يتيح وثِّقها إمكانية التواصل مع العديد من السطحات القريبة من منطة الحادث '),
    OnboardingInfo(
        'assets/images/Follow-up-reports.gif',
        'متابعة الحوادث والتقارير\nالخاصة بك',
        'يمكِّنُك وثِّق من الاستعلام عن الحوادث الحالية وعن الحوادث السابقة')
  ];
}
