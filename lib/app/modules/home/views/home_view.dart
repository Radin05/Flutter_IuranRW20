import 'package:flutter/material.dart'; // Import library untuk membuat tampilan aplikasi Flutter
import 'package:get/get.dart'; // Import library GetX untuk pengelolaan state dan routing
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import '../controllers/home_controller.dart'; // Import file controller HomeView

class HomeView extends GetView<HomeController> {
  // Deklarasi class HomeView dengan inheritance dari GetView dan generic type HomeController
  const HomeView({Key? key})
      : super(key: key); // Konstruktor untuk class HomeView

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: HexColor('#feeee8'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/dompet.json',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Rancamanyar Regency 2',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
