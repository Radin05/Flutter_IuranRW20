import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iwwrw20/app/data/Keluarga.dart';
import 'package:iwwrw20/app/data/Pembayaran.dart';
import 'package:iwwrw20/app/modules/dashboard/views/kas_view.dart';
import 'package:iwwrw20/app/modules/dashboard/views/keluarga_view.dart';
import 'package:iwwrw20/app/modules/dashboard/views/pembayaran_view.dart';
import 'package:iwwrw20/app/modules/dashboard/views/profile_view_view.dart';
import 'package:iwwrw20/app/utils/api.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');

  var keluarga = <Keluargas>[].obs;

  var pembayaranList = <Pembayarans>[].obs;
  var isLoadingPembayaran = false.obs;

  final List<Widget> pages = [
    KeluargaView(),
    PembayaranView(),
    KasView(),
    ProfileView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;

    if (index == 1) {
      fetchPembayaran();
    }
  }

  Future<void> fetchPembayaran() async {
    isLoadingPembayaran.value = true;

    try {
      final response = await _getConnect.get(
        BaseUrl.pembayaran,
        headers: {'Authorization': "Bearer $token"},
        contentType: "application/json",
      );

      if (response.statusCode == 200 && response.body['success']) {
        final result = PembayaranResponse.fromJson(response.body);
        pembayaranList.value = result.pembayarans ?? [];
      } else {
        Get.snackbar('Gagal', 'Gagal memuat data pembayaran');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoadingPembayaran.value = false;
    }
  }

  Future<void> tambahPembayaran({
    required String noKk,
    required DateTime tglPembayaran,
    required int bulan,
    required int tahun,
    required int jumlah,
  }) async {
    try {
      final response = await _getConnect.post(
        BaseUrl.pembayaran,
        {
          'no_kk_keluarga': noKk,
          'tgl_pembayaran': tglPembayaran.toIso8601String(),
          'month': bulan,
          'year': tahun,
          'sejumlah': jumlah,
        },
        headers: {'Authorization': "Bearer $token"},
      );

      if (response.statusCode == 200 && response.body['success']) {
        Get.snackbar('Berhasil', 'Pembayaran berhasil ditambahkan');
        fetchPembayaran(); // Refresh data
        Get.back(); // Kembali ke halaman sebelumnya
      } else {
        Get.snackbar('Gagal', 'Gagal menyimpan pembayaran');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    }
  }

  Future<KeluargaResponse> getKeluarga() async {
    final response = await _getConnect.get(
      BaseUrl.keluarga,
      headers: {'Authorization': "Bearer $token"},
      contentType: "application/json",
    );
    return KeluargaResponse.fromJson(response.body);
  }

  @override
  void onInit() {
    getKeluarga();
    super.onInit();
  }
}
