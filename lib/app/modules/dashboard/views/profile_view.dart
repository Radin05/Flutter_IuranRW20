import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwwrw20/app/modules/Profile/controllers/profile_controller.dart';

const String baseURL = '';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: const Color(0xFFC4F299),
        elevation: 0,
        foregroundColor: Colors.black87,
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

          final displayName =
              profile.name ?? profile.keluarga?.namaKeluarga ?? '-';
          final rtName = profile.rt?.namaRT ?? 'RT tidak diketahui';

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: const BoxDecoration(
                    color: Color(0xFFC4F299),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -20), // geser avatar ke atas
                        child: CircleAvatar(
                          radius: 70, // lebih kecil dari sebelumnya
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Align(
                              alignment: const Alignment(0,
                                  -0.3), // geser wajah ke atas dalam lingkaran
                              heightFactor: 1.2, // bisa diubah sesuai kebutuhan
                              child: Image(
                                image: profile.foto != null
                                    ? NetworkImage(
                                        'http://127.0.0.1:8000/gambar_profile/${profile.foto}')
                                    : const AssetImage(
                                            'assets/images/default_user.png')
                                        as ImageProvider,
                                fit: BoxFit.cover,
                                height: 140, // sesuaikan agar proporsional
                                width: 140,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        displayName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        profile.email ?? '-',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.home_outlined,
                              color: Colors.green),
                          title: const Text('RT'),
                          subtitle: Text(rtName),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.verified_user,
                              color: Colors.green),
                          title: const Text('Kedudukan'),
                          subtitle: Text(
                            '${(profile.kedudukan ?? 'Warga')} - ${profile.rt?.namaRT ?? 'RT Tidak Diketahui'}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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
                                Get.back();
                                controller.logout();
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
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
