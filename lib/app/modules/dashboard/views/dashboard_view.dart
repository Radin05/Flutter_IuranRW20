import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  static const Color greenPrimary = Color(0xFFC4F299); // Hijau muda
  static const Color brownAccent = Color(0xFFDFA06E); // Coklat dompet
  static const Color backgroundColor = Color(0xFFF9F9F9); 
  static const Color whiteColor = Colors.white;
// Latar putih soft

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Obx(
      () => Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: controller.pages[controller.selectedIndex.value],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: brownAccent,
          unselectedItemColor: Colors.grey[500],
          backgroundColor: whiteColor,
          elevation: 10,
          showUnselectedLabels: true,
          selectedFontSize: 13,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Warga',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Kas RT/RW',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
