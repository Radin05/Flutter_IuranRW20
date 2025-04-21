import 'package:get/get.dart';
import 'package:iwwrw20/app/modules/KasRw/controllers/pengeluaran_kas_rw.dart';

import '../controllers/kas_rw_controller.dart';

class KasRwBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KasRwController>(
      () => KasRwController(),
    );
    Get.lazyPut<PengeluaranRwController>(
      () => PengeluaranRwController(),
    );
  }
}
