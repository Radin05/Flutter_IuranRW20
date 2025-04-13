import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iwwrw20/app/data/Kegiatan.dart';
import 'package:iwwrw20/app/data/KeluargaAll.dart';
import 'package:iwwrw20/app/modules/dashboard/views/beranda_view.dart';
import 'package:iwwrw20/app/modules/dashboard/views/kas_view.dart';
import 'package:iwwrw20/app/modules/dashboard/views/keluarga_view.dart';
import 'package:iwwrw20/app/modules/dashboard/views/profile_view.dart';
import 'package:iwwrw20/app/utils/api.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');

  final keluarga = <Keluargas>[].obs;

  final List<Widget> pages = [
    BerandaView(),
    const KeluargaView(),
    const KasView(),
    const ProfileView(),
  ];

  // ✅ Tambahan untuk fitur filter RT
  final rtList = <Rt>[].obs;
  final selectedRt = Rxn<Rt>();
  final filteredKeluarga = <Keluargas>[].obs;

  final kegiatanList = <Kegiatan>[].obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> fetchKegiatanRt() async {
    try {
      final response = await _getConnect.get(
        BaseUrl.kegiatan_rt, // endpoint sesuai route kamu
        headers: {'Authorization': "Bearer $token"},
      );

      if (response.statusCode == 200) {
        final data = KegiatanResponse.fromJson(response.body);
        kegiatanList.value = data.kegiatan ?? [];
      } else {
        Get.snackbar("Gagal", "Tidak dapat mengambil data kegiatan");
      }
    } catch (e) {
      Get.snackbar(
          "Error", "Terjadi kesalahan saat mengambil data kegiatan: $e");
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
        Get.back();
      } else {
        Get.snackbar('Gagal', 'Gagal menyimpan pembayaran');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    }
  }

  Future<void> fetchKeluarga() async {
    try {
      final response = await _getConnect.get(
        BaseUrl.keluarga,
        headers: {'Authorization': "Bearer $token"},
        contentType: "application/json",
      );
      final data = AllKeluargaResponse.fromJson(response.body);

      if (data.keluargas != null) {
        keluarga.value = data.keluargas!;
        _generateRtList();
        _filterBySelectedRt(); // Awal tampil semua atau default RT
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data keluarga: $e');
    }
  }

  void _generateRtList() {
    final uniqueRts = <int, Rt>{};

    for (var keluargaItem in keluarga) {
      final rt = keluargaItem.rt;
      if (rt != null && !uniqueRts.containsKey(rt.id)) {
        uniqueRts[rt.id!] = rt;
      }
    }

    rtList.assignAll(uniqueRts.values.toList());
  }

  void setSelectedRt(Rt rt) {
    selectedRt.value = rt;
    _filterBySelectedRt();
  }

  void _filterBySelectedRt() {
    if (selectedRt.value == null) {
      filteredKeluarga.assignAll(keluarga);
    } else {
      filteredKeluarga.assignAll(
        keluarga.where((k) => k.rtId == selectedRt.value!.id).toList(),
      );
    }
  }

  @override
  void onInit() {
    fetchKeluarga();
    fetchKegiatanRt();
    super.onInit();
  }
}
