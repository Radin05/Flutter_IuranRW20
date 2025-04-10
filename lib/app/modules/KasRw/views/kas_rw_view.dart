import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kas_rw_controller.dart';

class KasRwView extends GetView<KasRwController> {
  const KasRwView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KasRwView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KasRwView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
