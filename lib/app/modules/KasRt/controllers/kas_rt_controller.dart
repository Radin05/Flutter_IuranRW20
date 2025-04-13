import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:iwwrw20/app/data/KasRt.dart';
import 'package:iwwrw20/app/utils/api.dart';

class KasRtController extends GetxController {
  final box = GetStorage();
  var isLoading = true.obs;
  var kasRtData = KasRt().obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchKasRt();
    super.onInit();
  }

  void fetchKasRt() async {
    isLoading.value = true;
    errorMessage.value = '';

    final token = box.read('token');
    final namaRt = box.read('nama_RT');

    if (namaRt == null || namaRt.isEmpty) {
      errorMessage.value = 'Nama RT tidak ditemukan, silakan login ulang.';
      isLoading.value = false;
      return;
    }

    try {
      final response = await http.get(
        Uri.parse("${BaseUrl.kas_rt}/$namaRt"),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final parsed = KasRtResponse.fromJson(data);
        if (parsed.kasRt != null) {
          kasRtData.value = parsed.kasRt!;
        } else {
          errorMessage.value = 'Data kas RT tidak ditemukan.';
        }
      } else {
        errorMessage.value = data['message'] ?? 'Gagal memuat data Kas RT';
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
