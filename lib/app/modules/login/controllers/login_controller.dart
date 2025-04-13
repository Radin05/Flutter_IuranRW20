import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:iwwrw20/app/modules/dashboard/views/dashboard_view.dart';
import 'package:iwwrw20/app/utils/api.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  void loginNow() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Peringatan',
        'Email dan password tidak boleh kosong',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    final url = Uri.parse(BaseUrl.login);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = data['user'];

      // Simpan token dan informasi pengguna di GetStorage
      authToken.write('token', data['access_token']);
      authToken.write('user', user);

      // Periksa apakah RT ada dalam data pengguna
      if (user != null && user['rt'] != null) {
        final namaRt = user['rt']['nama_RT']?.toString().trim();
        if (namaRt != null && namaRt.isNotEmpty) {
          authToken.write('nama_RT', namaRt);
        }
      }

      // Navigasi ke DashboardView setelah login berhasil
      Get.offAll(() => const DashboardView());
    } else {
      final data = jsonDecode(response.body);
      Get.snackbar(
        'Error',
        data['error'].toString(),
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
