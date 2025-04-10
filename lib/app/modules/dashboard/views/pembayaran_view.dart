import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iwwrw20/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:iwwrw20/app/modules/dashboard/views/add_pembayaran_view.dart';

class PembayaranView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(() {
      if (controller.isLoadingPembayaran.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tombol tambah di atas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Get.to(() => AddPembayaranView());
              },
              icon: const Icon(Icons.add),
              label: const Text("Tambah Pembayaran"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ),

          // Tabel data pembayaran
          Expanded(
            child: controller.pembayaranList.isEmpty
                ? const Center(child: Text("Belum ada data pembayaran."))
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue.shade100),
                      columns: const [
                        DataColumn(label: Text('No')),
                        DataColumn(label: Text('Nama Keluarga')),
                        DataColumn(label: Text('Jumlah')),
                        DataColumn(label: Text('Tanggal Pembayaran')),
                      ],
                      rows: List.generate(
                        controller.pembayaranList.length,
                        (index) {
                          final pembayaran = controller.pembayaranList[index];
                          final keluarga = pembayaran.keluarga;
                          final tanggal = pembayaran.tglPembayaran != null
                              ? DateFormat('dd MMM yyyy', 'id_ID').format(
                                  DateTime.parse(pembayaran.tglPembayaran!))
                              : '-';

                          return DataRow(cells: [
                            DataCell(Text('${index + 1}')),
                            DataCell(Text(keluarga?.namaKeluarga ?? "-")),
                            DataCell(
                                Text('Rp ${pembayaran.sejumlah ?? "-"}')),
                            DataCell(Text(tanggal)),
                          ]);
                        },
                      ),
                    ),
                  ),
          ),
        ],
      );
    });
  }
}
