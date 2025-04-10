import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kas_rt_controller.dart';

class KasRtView extends StatelessWidget {
  const KasRtView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KasRtController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas RT'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.kasRt.value == null) {
          return const Center(child: Text("Data Kas RT tidak tersedia."));
        }

        return Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Jumlah Kas RT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Rp ${controller.kasRt.value!.jumlahKasRt ?? '0'}",
                    style: const TextStyle(fontSize: 24, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
