import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iwwrw20/app/data/PengeluaranRw.dart';
import 'package:iwwrw20/app/utils/api.dart';

class PengeluaranRwController extends GetxController {
  var pengeluaranList = <PengeluaransRw>[].obs;
  var isLoading = false.obs;
  final box = GetStorage();
  
  @override
  void onInit() {
    fetchPengeluaranRw();
    super.onInit();
  }

  void fetchPengeluaranRw() async {
    isLoading.value = true;
    try {
      final response = await GetConnect().get(
        '${BaseUrl.pengeluaran_rw}',
        headers: {
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        final pengeluaranResponse = PengeluaranRwResponse.fromJson(response.body);
        pengeluaranList.value = pengeluaranResponse.pengeluarans ?? [];
      } else {
        Get.snackbar('Error', 'Gagal mengambil data pengeluaran RW');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
