import 'package:get/get.dart';

import '../controllers/kas_rt_controller.dart';

class KasRtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KasRtController>(
      () => KasRtController(),
    );
  }
}
