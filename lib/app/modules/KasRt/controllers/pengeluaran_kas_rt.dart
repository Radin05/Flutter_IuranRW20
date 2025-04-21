import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iwwrw20/app/data/PengeluaranRt.dart';
import 'package:iwwrw20/app/utils/api.dart';

class PengeluaranRtController extends GetxController {
  var pengeluarans = <PengeluaransRt>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

    final box = GetStorage();

  Future<void> fetchPengeluaranRt() async {
    isLoading.value = true;
    try {
      final response = await GetConnect().get(
        '${BaseUrl.pengeluaran_rt}',
        headers: {
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        final data = PengeluaranRtResponse.fromJson(response.body);
        pengeluarans.value = data.pengeluarans ?? [];
      } else {
        errorMessage.value = 'Gagal memuat data: ${response.statusText}';
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
