import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iwwrw20/app/modules/KasRt/controllers/kas_rt_controller.dart';

class KasRtView extends GetView<KasRtController> {
  const KasRtView({Key? key}) : super(key: key);

  String formatRupiah(String? value) {
    if (value == null) return 'Rp 0';
    final number = double.tryParse(value) ?? 0;
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas RT'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          final kas = controller.kasRtData.value;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet, size: 40, color: Colors.green),
                title: const Text(
                  "Jumlah Kas RT",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  formatRupiah(kas.jumlahKasRt),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
