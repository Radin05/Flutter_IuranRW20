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

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Foto
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profile.foto ?? ''),
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 20),

                // Nama
                Text(
                  profile.name ?? '-',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),
                Text(profile.email ?? '-', style: const TextStyle(color: Colors.grey)),

                const SizedBox(height: 16),
                Divider(),

                // Detail lainnya
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('RT'),
                  subtitle: Text('RT ${profile.rtId ?? '-'}'),
                ),
                ListTile(
                  leading: const Icon(Icons.verified_user),
                  title: const Text('Kedudukan'),
                  subtitle: Text(profile.kedudukan ?? '-'),
                ),

                const Spacer(),

                // Tombol Logout
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: controller.logout,
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
