import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iwwrw20/app/data/KasRt.dart';
import 'package:iwwrw20/app/utils/api.dart';

class KasRtController extends GetxController {
  var selectedIndex = 0.obs;
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');

  var kasRt = Rxn<KasRt>(); // Ubah jadi single object
  var isLoading = false.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> getKasRt() async {
    isLoading.value = true;
    try {
      final response = await _getConnect.get(
        BaseUrl.kas_rt,
        headers: {'Authorization': "Bearer $token"},
        contentType: "application/json",
      );

      if (response.statusCode == 200 && response.body['success']) {
        final result = KasRtResponse.fromJson(response.body);
        kasRt.value = result.kasRt;
      } else {
        Get.snackbar('Gagal', 'Gagal memuat data Kas RT');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getKasRt();
    super.onInit();
  }
}
