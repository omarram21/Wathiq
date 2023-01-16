import 'package:flutter/material.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/views/navbar/navbar.dart';
import 'package:wathiq/widgets/text.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 75, left: 20, right: 20, bottom: 50),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset("assets/images/logo.png",
                  width: MediaQuery.of(context).size.width / 1.5),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget(data: "New Accident Report", bold: true),
                      Image.asset("assets/images/car-white.png", width: 50),
                    ],
                  ),
                  onPressed: () {
                    controller1.index = 2;
                  },
                ),
              ),
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(AppColors.BLUE),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget(data: "Order Two-Truck Van", bold: true),
                      Image.asset("assets/images/shipping.png", width: 50),
                    ],
                  ),
                  onPressed: () {
                    controller1.index = 1;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(AppColors.BLUE),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget(data: "My Old Accidents", bold: true),
                      Icon(Icons.history, size: 50)
                      // Image.asset("assets/images/shipping.png", width: 50),
                    ],
                  ),
                  onPressed: () {
                    controller1.index = 3;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
