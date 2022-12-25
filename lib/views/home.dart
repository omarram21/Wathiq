import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/views/history.dart';
import 'package:wathiq/views/profile.dart';
import 'package:wathiq/views/tow-truck.dart';
import 'package:wathiq/views/wathiq.dart';

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
              ElevatedButton(
                onPressed: () {},
                child: Text("NEW ACCIDENT"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
