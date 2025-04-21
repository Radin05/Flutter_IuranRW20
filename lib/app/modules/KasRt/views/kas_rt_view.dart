import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iwwrw20/app/modules/KasRt/controllers/kas_rt_controller.dart';
import 'package:iwwrw20/app/modules/KasRt/controllers/pengeluaran_kas_rt.dart';
import 'package:iwwrw20/app/theme/color.dart';

class KasRtView extends StatelessWidget {
  KasRtView({Key? key}) : super(key: key);

  final KasRtController controller = Get.find();
  final PengeluaranRtController pengeluaranController =
      Get.put(PengeluaranRtController());

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
            locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
        .format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.greenPrimary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textDark),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Kas RT',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          final kas = controller.kasRtData.value;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.greenPrimary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cardShadow.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: [
                      const Icon(Icons.account_balance_wallet,
                          size: 40, color: AppColors.textDark),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Jumlah Kas RT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formatRupiah(kas.jumlahKasRt),
                            style: const TextStyle(
                              fontSize: 24,
                              color: AppColors.textDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Pengeluaran
                Obx(() {
                  if (pengeluaranController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (pengeluaranController.errorMessage.isNotEmpty) {
                    return Text(pengeluaranController.errorMessage.value);
                  } else if (pengeluaranController.pengeluarans.isEmpty) {
                    return const Text('Belum ada pengeluaran.');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Daftar Pengeluaran RT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pengeluaranController.pengeluarans.length,
                          itemBuilder: (context, index) {
                            final item =
                                pengeluaranController.pengeluarans[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 3,
                              shadowColor: AppColors.cardShadow,
                              child: ListTile(
                                title: Text(
                                  item.keterangan?.replaceAll(
                                          RegExp(r'<[^>]*>'), '') ??
                                      '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  'Tanggal: ${item.tglPengeluaran ?? '-'}',
                                  style: const TextStyle(fontSize: 13),
                                ),
                                trailing: Text(
                                  formatRupiah(item.nominal),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.brownAccent,
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
        }
      }),
    );
  }
}
