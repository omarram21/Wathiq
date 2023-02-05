import 'package:flutter_test/flutter_test.dart';
import 'package:wathiq/controllers/choose-two-controller.dart';
import 'package:wathiq/controllers/onboarding-controller.dart';

void main() {
  OnboardingController _onboardingController = OnboardingController();
  ChooseTwoControllers _chooseTwoControllers = ChooseTwoControllers();

  test("default value of noOfCars", () {
    expect(_chooseTwoControllers.numOfCars.value, 2);
  });
  test("after increasing it ", () {
    _chooseTwoControllers.incresining();
    expect(_chooseTwoControllers.numOfCars.value, 3);
  });
  test("after dcreeing  it", () {
    _chooseTwoControllers.decresining();
    expect(_chooseTwoControllers.numOfCars.value, 2);
  });
}
