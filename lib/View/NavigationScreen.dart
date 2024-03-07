
import 'package:flawless_beauty/Controller/Home%20View/NavigationScreensController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  final viewcontroller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
              height: 80,
          elevation: 0,
          //backgroundColor: darkmode? tColors.black : Colors.white,
          selectedIndex: viewcontroller.selectedIndex.value,
          onDestinationSelected: (index)=>viewcontroller.selectedIndex.value=index,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home),label: "Home",),
            NavigationDestination(icon: Icon(Icons.date_range),label: "Appointment",),
            NavigationDestination(icon: Icon(Icons.home),label: "Offers",),
            NavigationDestination(icon: Icon(Icons.person),label: "Profile",),

          ],
        ),
      ),
      body: Obx(()=> viewcontroller.screen[viewcontroller.selectedIndex.value]),

    );
  }
}