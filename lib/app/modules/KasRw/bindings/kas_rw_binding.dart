import 'package:get/get.dart';

import '../controllers/kas_rw_controller.dart';

class KasRwBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KasRwController>(
      () => KasRwController(),
    );
  }
}
