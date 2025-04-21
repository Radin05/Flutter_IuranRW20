import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iwwrw20/app/modules/KasRw/controllers/kas_rw_controller.dart';
import 'package:iwwrw20/app/modules/KasRw/controllers/pengeluaran_kas_rw.dart';

class KasRwView extends StatelessWidget {
  const KasRwView({super.key});

  String formatRupiah(dynamic value) {
    if (value == null) return 'Rp 0';

    double number;
    if (value is String) {
      number = double.tryParse(value.replaceAll(',', '')) ?? 0;
    } else if (value is int) {
      number = value.toDouble();
    } else if (value is double) {
      number = value;
    } else {
      number = 0;
    }

    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(number);
  }

  @override
  Widget build(BuildContext context) {
    final pengeluaranController = Get.put(PengeluaranRwController());
    final kasController = Get.find<KasRwController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FFF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC4F299),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Kas RW',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (kasController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (kasController.kasRw.value.jumlahKasRw == null) {
          return const Center(child: Text('Data Kas RW tidak tersedia.'));
        }

        final kas = kasController.kasRw.value;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFC4F299),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 40,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Jumlah Kas RW",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatRupiah(kas.jumlahKasRw),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Obx(() {
                if (pengeluaranController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (pengeluaranController.pengeluaranList.isEmpty) {
                  return const Text('Belum ada pengeluaran.');
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Daftar Pengeluaran RW",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pengeluaranController.pengeluaranList.length,
                        itemBuilder: (context, index) {
                          final item =
                              pengeluaranController.pengeluaranList[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              title: Text(
                                item.keterangan
                                        ?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                                    '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                'Tanggal: ${item.tglPengeluaran ?? '-'}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: Text(
                                formatRupiah(item.nominal),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
              }),
            ],
          ),
        );
      }),
    );
  }
}
