import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iwwrw20/app/modules/dashboard/controllers/dashboard_controller.dart';

class AddPembayaranView extends StatefulWidget {
  const AddPembayaranView({super.key});

  @override
  State<AddPembayaranView> createState() => _AddPembayaranViewState();
}

class _AddPembayaranViewState extends State<AddPembayaranView> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<DashboardController>();

  String? selectedNoKK;
  DateTime? selectedDate;
  int? selectedMonth;
  int? selectedYear;
  TextEditingController jumlahController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.getKeluarga().then((res) {
      controller.keluarga.value = res.keluargas ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentYear = now.year;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pembayaran"),
        centerTitle: true,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Dropdown keluarga
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Pilih Keluarga'),
                  items: controller.keluarga.map((keluarga) {
                    return DropdownMenuItem<String>(
                      value: keluarga.noKk,
                      child: Text("${keluarga.namaKeluarga} - ${keluarga.noKk}"),
                    );
                  }).toList(),
                  value: selectedNoKK,
                  onChanged: (value) => setState(() => selectedNoKK = value),
                  validator: (value) => value == null ? "Wajib dipilih" : null,
                ),

                const SizedBox(height: 16),

                // Date Picker
                InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(currentYear + 3),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Pembayaran',
                      border: OutlineInputBorder(),
                    ),
                    child: Text(
                      selectedDate == null
                          ? 'Pilih tanggal'
                          : DateFormat('dd MMM yyyy', 'id_ID').format(selectedDate!),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Dropdown bulan
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Bulan'),
                  items: List.generate(12, (index) {
                    final month = index + 1;
                    return DropdownMenuItem<int>(
                      value: month,
                      child: Text(DateFormat('MMMM', 'id_ID')
                          .format(DateTime(0, month))),
                    );
                  }),
                  value: selectedMonth,
                  onChanged: (value) => setState(() => selectedMonth = value),
                  validator: (value) => value == null ? "Wajib dipilih" : null,
                ),

                const SizedBox(height: 16),

                // Dropdown tahun
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Tahun'),
                  items: List.generate(currentYear + 4 - 2020, (i) {
                    final year = currentYear + 3 - i;
                    return DropdownMenuItem<int>(
                      value: year,
                      child: Text('$year'),
                    );
                  }),
                  value: selectedYear,
                  onChanged: (value) => setState(() => selectedYear = value),
                  validator: (value) => value == null ? "Wajib dipilih" : null,
                ),

                const SizedBox(height: 16),

                // Jumlah pembayaran
                TextFormField(
                  controller: jumlahController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah Pembayaran',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? "Wajib diisi" : null,
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.tambahPembayaran(
                        noKk: selectedNoKK!,
                        tglPembayaran: selectedDate!,
                        bulan: selectedMonth!,
                        tahun: selectedYear!,
                        jumlah: int.parse(jumlahController.text),
                      );
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
