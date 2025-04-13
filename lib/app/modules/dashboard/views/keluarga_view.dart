import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwwrw20/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class KeluargaView extends GetView<DashboardController> {
  const KeluargaView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Keluarga'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.keluarga.isEmpty) {
          return Center(
            child: Lottie.network(
              'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
              width: MediaQuery.of(context).size.width / 1.5,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol filter RT
              const Text(
                "Pilih RT:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: controller.rtList.map((rt) {
                  final isSelected = controller.selectedRt.value?.id == rt.id;

                  return ChoiceChip(
                    label: Text(rt.namaRT ?? 'RT -'),
                    selected: isSelected,
                    onSelected: (_) => controller.setSelectedRt(rt),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Daftar keluarga berdasarkan RT
              Expanded(
                child: controller.filteredKeluarga.isEmpty
                    ? const Center(child: Text("Tidak ada data keluarga."))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2, // Lebih kotak, tidak tinggi
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: controller.filteredKeluarga.length,
                        itemBuilder: (context, index) {
                          final keluarga = controller.filteredKeluarga[index];
                          return ZoomTapAnimation(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.family_restroom,
                                        size: 32, color: Colors.blueAccent),
                                    const SizedBox(height: 8),
                                    Text(
                                      keluarga.namaKeluarga ??
                                          "Nama tidak tersedia",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.location_on,
                                            size: 16, color: Colors.grey),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            keluarga.alamat ??
                                                "Alamat tidak tersedia",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget buildListItem(IconData icon, String title, String? value) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      subtitle: Text(
        value ?? "Tidak diketahui",
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
