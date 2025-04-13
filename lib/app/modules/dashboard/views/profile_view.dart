import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwwrw20/app/modules/Profile/controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          }

          final profile = snapshot.data?.user;

          if (profile == null) {
            return const Center(child: Text("Profil tidak ditemukan."));
          }

          // Cek nama dari user.name atau keluarga.namaKeluarga
          final displayName =
              profile.name ?? profile.keluarga?.namaKeluarga ?? '-';
          final rtName = profile.rt?.namaRT ?? 'RT tidak diketahui';

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Foto Profil
                CircleAvatar(
                  radius: 50,
                  backgroundImage: profile.foto != null
                      ? NetworkImage(profile.foto!)
                      : const AssetImage('assets/images/default_user.png')
                          as ImageProvider,
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 20),

                // Nama
                Text(
                  displayName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // Email
                Text(
                  profile.email ?? '-',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 16),
                Divider(),

                // RT
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: const Text('RT'),
                  subtitle: Text(rtName),
                ),

                // Kedudukan
                ListTile(
                  leading: const Icon(Icons.verified_user),
                  title: const Text('Kedudukan'),
                  subtitle: Text(
                    '${(profile.kedudukan ?? 'Warga')} - ${profile.rt?.namaRT ?? 'RT Tidak Diketahui'}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),

                const Spacer(),

                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Konfirmasi Logout",
                        middleText: "Apakah Anda yakin ingin logout?",
                        textCancel: "Batal",
                        textConfirm: "Logout",
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                          Get.back(); // Close dialog
                          controller.logout(); // Run logout
                        },
                        buttonColor: Colors.red,
                      );
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
