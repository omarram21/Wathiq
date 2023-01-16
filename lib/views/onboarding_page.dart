import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

import '../constans.dart';
import '../controllers/onboarding-controller.dart';

class OnboardingPage extends StatelessWidget {
  // final _controller = OnboardingController();
  final _controller = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                            _controller.onboardingPages[index].imageAsset,
                            height: MediaQuery.of(context).size.height / 3),
                        SizedBox(height: 32),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "beIN",
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 25,
              left: 50,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? AppColors.WHITE
                            : AppColors.BLUE,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 50,
              bottom: 20,
              child: ElevatedButton(
                onPressed: _controller.forwardAction,
                child: Obx(() {
                  return Text(_controller.isLastPage ? 'Start' : 'Next');
                }),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.BLUE)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
