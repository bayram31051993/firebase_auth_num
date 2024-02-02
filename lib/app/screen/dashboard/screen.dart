import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/app/screen/screen.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
        init: DashboardController(),
        builder: (dc) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: bottomItems(),
              onTap: (value) => dc.onChangeIndex(value),
              currentIndex: dc.state.bottomIndex.value,
              unselectedLabelStyle: TextStyle(color: const Color.fromARGB(255, 157, 157, 157), fontSize: 13.sp),
            ),
            body: _widgetOptions[dc.state.bottomIndex.value],
          );
        });
  }

  List<BottomNavigationBarItem> bottomItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Мои проекты',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_rounded),
        label: 'Мой аккаунт',
      ),
    ];
  }

  final List<Widget> _widgetOptions = [const SizedBox(), const ProfileScreen()];
}
