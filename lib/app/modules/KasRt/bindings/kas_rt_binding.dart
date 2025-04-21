import 'package:get/get.dart';
import 'package:iwwrw20/app/modules/KasRt/controllers/kas_rt_controller.dart';
import 'package:iwwrw20/app/modules/KasRt/controllers/pengeluaran_kas_rt.dart';

class KasRtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KasRtController>(() => KasRtController());
    Get.lazyPut<PengeluaranRtController>(() => PengeluaranRtController());
  }
}
