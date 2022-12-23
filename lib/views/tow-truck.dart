import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/tows-truck-controller.dart';
import 'package:url_launcher/url_launcher.dart';

class TowTruck extends StatelessWidget {
  TowTruck({super.key});

  final _controller = Get.put(TowsTruckController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 75, left: 20, right: 20, bottom: 50),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Tows Truck",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 10),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select city :",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: AppColors.BLUE),
              ),
              child: DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    value: _controller.dropdownValue.value,
                    items: _controller.dropdownMenuItem,
                    onChanged: (onChanged) {
                      _controller.dropdownValue.value = onChanged;
                      _controller.selectCity();
                    },
                    dropdownColor: Colors.blue,
                    isExpanded: true,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => _controller.finalList.isEmpty
                    ? Center(child: Text("Nothing")) // put free pick
                    : ListView.separated(
                        itemCount: _controller.finalList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: AppColors.BLUE,
                            child: ListTile(
                              title: Text(_controller.finalList[index].name),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_controller.finalList[index].city),
                                  Text(_controller.finalList[index].phone)
                                ],
                              ),
                              trailing: const Icon(Icons.phone),
                              onTap: () async {
                                await launchUrl(Uri(
                                    scheme: 'tel',
                                    path: _controller.finalList[index].phone));
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
