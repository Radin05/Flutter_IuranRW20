import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iwwrw20/app/data/KegiatanRt.dart';
import 'package:iwwrw20/app/data/KegiatanRw.dart';
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

  final List<Widget> pages = [
    BerandaView(),
    const KeluargaView(),
    const KasView(),
    const ProfileView(),
  ];

  // Keluarga + RT Filter
  final keluarga = <Keluargas>[].obs;
  final rtList = <Rt>[].obs;
  final selectedRt = Rxn<Rt>();
  final filteredKeluarga = <Keluargas>[].obs;

  // Kegiatan RW
  final kegiatanList = <KegiatanRw>[].obs;
  final isLoadingKegiatan = false.obs;
  final kegiatanError = RxnString();

  // Kegiatan RT
  final kegiatanRtList = <KegiatanRt>[].obs;
  final isLoadingKegiatanRt = false.obs;
  final kegiatanRtError = RxnString();

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  // Fetch Keluarga dan RT
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
        _filterBySelectedRt();
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data keluarga: $e');
    }
  }

  void _generateRtList() {
    final uniqueRts = <int, Rt>{};
    for (var k in keluarga) {
      if (k.rt != null && !uniqueRts.containsKey(k.rt!.id)) {
        uniqueRts[k.rt!.id!] = k.rt!;
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

  // Kegiatan RW
  Future<KegiatanRwResponse> fetchKegiatan() async {
    try {
      isLoadingKegiatan.value = true;
      kegiatanError.value = null;

      final response = await _getConnect.get(
        BaseUrl.kegiatan_rw,
        headers: {'Authorization': "Bearer $token"},
        contentType: "application/json",
      );

      if (response.status.hasError) {
        kegiatanError.value = 'Terjadi kesalahan pada server';
        return KegiatanRwResponse(message: 'Error', kegiatan: []);
      }

      final data = KegiatanRwResponse.fromJson(response.body);
      if (data.kegiatan != null) {
        kegiatanList.assignAll(data.kegiatan!);
      }

      return data;
    } catch (e) {
      kegiatanError.value = 'Gagal mengambil data kegiatan RW: $e';
      return KegiatanRwResponse(message: 'Error', kegiatan: []);
    } finally {
      isLoadingKegiatan.value = false;
    }
  }

  Future<void> refreshKegiatan() async {
    await fetchKegiatan();
  }

  // Kegiatan RT
  Future<KegiatanRtResponse> fetchKegiatanRt() async {
    try {
      isLoadingKegiatanRt.value = true;
      kegiatanRtError.value = null;

      final response = await _getConnect.get(
        BaseUrl.kegiatan_rt,
        headers: {'Authorization': "Bearer $token"},
        contentType: "application/json",
      );

      if (response.status.hasError) {
        kegiatanRtError.value = 'Terjadi kesalahan pada server';
        return KegiatanRtResponse(message: 'Error', kegiatan: []);
      }

      final data = KegiatanRtResponse.fromJson(response.body);
      if (data.kegiatan != null) {
        kegiatanRtList.assignAll(data.kegiatan!);
      }

      return data;
    } catch (e) {
      kegiatanRtError.value = 'Gagal mengambil data kegiatan RT: $e';
      return KegiatanRtResponse(message: 'Error', kegiatan: []);
    } finally {
      isLoadingKegiatanRt.value = false;
    }
  }

  Future<void> refreshKegiatanRt() async {
    await fetchKegiatanRt();
  }

  // Helper: Format tanggal
  String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      const months = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agt", "Sep", "Okt", "Nov", "Des"];
      return "${date.day}\n${months[date.month - 1]}";
    } catch (e) {
      return "N/A";
    }
  }

  // Helper: Format jam
  String formatTime(String timeString) {
    try {
      final parts = timeString.split(":");
      return "${parts[0]}:${parts[1]}";
    } catch (e) {
      return "N/A";
    }
  }

  // Helper: Bersihkan tag HTML
  String stripHtmlTags(String htmlText) {
    final exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: false);
    return htmlText.replaceAll(exp, "");
  }

  @override
  void onInit() {
    super.onInit();
    fetchKeluarga();
    fetchKegiatan();
    fetchKegiatanRt();
  }
}
