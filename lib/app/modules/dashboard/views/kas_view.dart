import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KasView extends StatelessWidget {
  const KasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Halaman Kas",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                textStyle: const TextStyle(fontSize: 16),
              ),
              icon: const Icon(Icons.account_balance),
              label: const Text("Lihat Kas RW"),
              onPressed: () {
                // Arahkan ke halaman Kas RW
                Get.toNamed('/kas-rw');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                textStyle: const TextStyle(fontSize: 16),
              ),
              icon: const Icon(Icons.home_work),
              label: const Text("Lihat Kas RT"),
              onPressed: () {
                // Arahkan ke halaman Kas RT
                Get.toNamed('/kas-rt');
              },
            ),
          ],
        ),
      ),
    );
  }
}
