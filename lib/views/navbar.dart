import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/views/history.dart';
import 'package:wathiq/views/home.dart';
import 'package:wathiq/views/profile.dart';
import 'package:wathiq/views/tow-truck.dart';
import 'package:wathiq/views/wathiq.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: screens,
        items: items,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.style14, //1 3 16
        backgroundColor: AppColors.BLUE,

        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          colorBehindNavBar: Colors.white,
        ),
      ),
    );
  }

  List<Widget> screens = [
    Home(),
    TowTruck(),
    Wathiq(),
    History(),
    Profile(),
  ];

  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: "Home",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset("assets/images/shipping.png"),
      title: "Truck",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.add),
      title: "Wathiq",
      activeColorPrimary: Colors.red.shade900,
      inactiveColorPrimary: Colors.red,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.history),
      title: "History",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.account_circle_sharp),
      title: "Profile",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}
