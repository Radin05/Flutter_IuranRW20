import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwwrw20/app/theme/color.dart';
import 'package:lottie/lottie.dart';

class KasView extends StatelessWidget {
  const KasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.greenPrimary,
        centerTitle: true,
        title: const Text(
          'Menu Kas',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animasi futuristik
              Lottie.asset(
              'assets/lottie/kas.json',
                width: 180,
              ),

              const SizedBox(height: 20),
              Text(
                "Akses Cepat Kas RT & RW",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Kelola dan pantau kas lingkungan Anda dengan mudah",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Tombol Kas RW
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenPrimary,
                  foregroundColor: AppColors.textDark,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: const Icon(Icons.account_balance_wallet),
                label: const Text("Lihat Kas RW"),
                onPressed: () => Get.toNamed('/kas-rw'),
              ),
              const SizedBox(height: 20),

              // Tombol Kas RT
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brownAccent,
                  foregroundColor: AppColors.background,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: const Icon(Icons.home_work_outlined),
                label: const Text("Lihat Kas RT"),
                onPressed: () => Get.toNamed('/kas-rt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
