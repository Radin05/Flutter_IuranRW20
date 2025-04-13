import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kas_rw_controller.dart';

class KasRwView extends GetView<KasRwController> {
  const KasRwView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas RW'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.kasRw.value.jumlahKasRw != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Jumlah Kas RW Saat Ini:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Rp ${controller.kasRw.value.jumlahKasRw}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Data Kas RW tidak tersedia.'));
        }
      }),
    );
  }
}
