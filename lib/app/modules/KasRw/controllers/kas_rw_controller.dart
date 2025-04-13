import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:iwwrw20/app/data/KasRw.dart';
import 'package:iwwrw20/app/utils/api.dart';

class KasRwController extends GetxController {
  var isLoading = true.obs;
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');
  var kasRw = KasRw().obs;

  // Ganti dengan URL endpoint API milikmu
  final String apiUrl = 'https://example.com/api/kas-rw';

  @override
  void onInit() {
    super.onInit();
    fetchKasRw();
  }

  Future<void> fetchKasRw() async {
    isLoading.value = true;

    try {
      final response = await _getConnect.get(
        BaseUrl.kas_rw,
        headers: {'Authorization': "Bearer $token"},
        contentType: "application/json",
      );

      if (response.statusCode == 200 && response.body['success']) {
        final result = KasRwResponse.fromJson(response.body);
        if (result.kasRw != null) {
          kasRw.value = result.kasRw!;
        }
      } else {
        Get.snackbar('Gagal', 'Gagal memuat data Kas RW');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
