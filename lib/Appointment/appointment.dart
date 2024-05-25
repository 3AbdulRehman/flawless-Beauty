import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Flawless Salon Appointment'),
        ),
        body: Column(
          children: [
            TabBar(
                dividerColor: TColors.grey,
              tabs: [
                Tab(text: 'Haircutting'),
                Tab(text: 'Makeup'),
                Tab(text: 'Facial'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('heellp Content')),
                  Center(child: Text('Makeup Content')),
                  Center(child: Text('Facial Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
