import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/wating-page.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class History extends StatefulWidget {
  History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('accidents').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Card(
                color: AppColors.BLUE,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(data: "01355", bold: true, size: 25),
                      TextWidget(data: "10/02/2022   1:11"),
                    ],
                  ),
                  minVerticalPadding: 20,
                  subtitle:
                      TextWidget(data: "Your application is under review"),
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.green,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(data: "01355", bold: true, size: 25),
                      TextWidget(data: "20/3/2022   10:15"),
                    ],
                  ),
                  minVerticalPadding: 20,
                  subtitle: TextWidget(data: "Your request has been reviewed"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
