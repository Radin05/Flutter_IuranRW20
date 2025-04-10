import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iwwrw20/app/data/Keluarga.dart';
import 'package:iwwrw20/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class KeluargaView extends GetView {
  const KeluargaView({super.key});

  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Keluarga'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<KeluargaResponse>(
          future: controller.getKeluarga(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.network(
                  'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
                  repeat: true,
                  width: MediaQuery.of(context).size.width / 1,
                ),
              );
            }
            if (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.keluargas == null) {
              return const Center(child: Text("Tidak ada data"));
            }
            if (snapshot.data!.keluargas!.isEmpty) {
              return const Center(child: Text("Tidak ada data"));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: snapshot.data!.keluargas!.length,
              itemBuilder: (context, index) {
                final keluarga = snapshot.data!.keluargas![index];
                return ZoomTapAnimation(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nomor KK
                          Row(
                            children: [
                              const Icon(Icons.badge, color: Colors.blue),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  keluarga.noKk ?? "Tidak tersedia",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Nama Keluarga
                          ListTile(
                            leading: const Icon(Icons.family_restroom,
                                color: Colors.green),
                            title: Text(
                              'Nama Keluarga',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            subtitle: Text(
                              keluarga.namaKeluarga ?? "Tidak diketahui",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),

                          // Alamat
                          ListTile(
                            leading: const Icon(Icons.location_on,
                                color: Colors.red),
                            title: Text(
                              'Alamat',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            subtitle: Text(
                              keluarga.alamat ?? "Tidak diketahui",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),

                          // Nomor Telepon
                          ListTile(
                            leading: const Icon(Icons.phone,
                                color: Colors.blueAccent),
                            title: Text(
                              'No Telepon',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            subtitle: Text(
                              keluarga.noTelp ?? "Tidak diketahui",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),

                          // RT
                          ListTile(
                            leading: const Icon(Icons.apartment,
                                color: Colors.orange),
                            title: Text(
                              'RT',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            subtitle: Text(
                              keluarga.rtId?.toString() ?? "Tidak diketahui",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
