import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wathiq/models/tows-truck-model.dart';

class TowsTruckController extends GetxController {
  RxString dropdownValue = 'Amman'.obs;
  List<TowsTruckModule> finalList = <TowsTruckModule>[].obs;

  @override
  onInit() {
    super.onInit();
    selectCity();
  }

  //citys
  List<DropdownMenuItem>? dropdownMenuItem = [
    const DropdownMenuItem<String>(value: "Amman", child: Text("Amman")),
    const DropdownMenuItem<String>(value: "Irbid", child: Text("Irbid")),
    const DropdownMenuItem<String>(
        value: "At-Tafilah", child: Text("At-Tafilah")),
    const DropdownMenuItem<String>(value: "Zarqa", child: Text("Zarqa")),
  ];
  //mostakdemen
  List<TowsTruckModule> towsTruckModule = [
    TowsTruckModule('Omar Ramadan', '+962 795854460', 'Amman'),
    TowsTruckModule('Neymar', '+962 795854460', 'Amman'),
    TowsTruckModule('Lionel Messi', '+962 777777777', 'Amman'),
    TowsTruckModule('Sami Hamad', '+962 798854645', 'Irbid'),
    TowsTruckModule('Mohamed Salah', '+962 798854645', 'Irbid'),
    TowsTruckModule('Cristiano Ronaldo', '+962 798857880', 'At-Tafilah'),
    TowsTruckModule('Kylian Mbappé', '+962 798857880', 'Zarqa'),
  ];

  void selectCity() {
    finalList.clear();
    for (var element in towsTruckModule) {
      if (element.city == dropdownValue.value) finalList.add(element);
    }
  }
}
