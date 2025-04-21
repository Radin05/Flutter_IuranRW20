import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwwrw20/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:iwwrw20/app/theme/build_step_widget.dart';
import 'package:iwwrw20/app/theme/color.dart';
import 'package:url_launcher/url_launcher.dart';

class BerandaView extends StatelessWidget {
  BerandaView({Key? key}) : super(key: key);

  static const _tabs = [
    Tab(icon: Icon(Icons.info), text: "Info"),
    Tab(icon: Icon(Icons.support_agent), text: "Layanan"),
    Tab(icon: Icon(Icons.event_note), text: "Kegiatan"),
  ];

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "kerja bakti":
        return Colors.blue;
      case "sosial":
        return Colors.green;
      case "rapat":
        return Colors.orange;
      case "pengajian":
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 220.0,
                floating: false,
                pinned: true,
                stretch: true,
                backgroundColor: AppColors.greenPrimary,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: const Text(
                    "Rancamanyar Regency 2",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  background: Image.asset(
                    "assets/images/header.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 3.0, color: AppColors.brownAccent),
                      insets: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                    labelColor: AppColors.brownAccent,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    tabs: _tabs,
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Container(
            color: AppColors.greenPrimary.withOpacity(0.2),
            child: TabBarView(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),

                        // Lokasi Section
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            "Rancamanyar Regency 2 terletak di Jalan Bojong Sayang, Desa Rancamanyar, Kecamatan Baleendah, Kabupaten Bandung, Jawa Barat 40375.\n\n"
                            "Perumahan ini berada di kawasan yang strategis, menawarkan lingkungan yang nyaman dan asri, ideal untuk tempat tinggal keluarga. Komplek ini memiliki berbagai fasilitas seperti GOR, masjid, lapangan, dan berbagai kegiatan mingguan yang mempererat kebersamaan warga.\n\n"
                            "Dengan fasilitas tersebut, Rancamanyar Regency 2 menjadi tempat yang sempurna untuk menjalin komunitas yang harmonis.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Galeri Section
                        const Text(
                          "Galeri",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            "\"Foto ini bukan sekadar gambar, tapi cerminan cinta dan kebersamaan warga RW 20.\"",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Gambar slider simulasi
                        SizedBox(
                          height: 180,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            children: List.generate(5, (index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                width: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: index == 2
                                        ? Colors.teal
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/g${index + 1}.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Bagian Iuran Warga (judul + paragraf)
                        Container(
                          width: double.infinity,
                          color: AppColors.greenPrimary,
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Iuran Warga",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.brownAccent,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Iuran Warga merupakan kontribusi keuangan rutin yang dibayarkan setiap bulan oleh setiap keluarga di lingkungan RT masing-masing. Iuran ini dikelola oleh pengurus RT dan selanjutnya sebagian akan disetorkan ke tingkat RW. Dana yang terkumpul digunakan untuk mendukung berbagai keperluan bersama, seperti operasional kebersihan, keamanan, perbaikan infrastruktur, serta pelaksanaan kegiatan sosial dan kemasyarakatan.\n\n"
                                "Sistem iuran warga dapat diatur secara bulanan atau tahunan, dengan besaran yang telah disepakati bersama oleh warga dan pengurus. Transparansi dalam pengelolaan iuran menjadi faktor penting agar seluruh warga dapat mengetahui pemasukan dan pengeluaran dana dengan jelas.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.textDark),
                              ),
                            ],
                          ),
                        ),

                        // Bagian Sistem Iuran (6 langkah)
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Sistem Iuran",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.brownAccent,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Bagaimana cara iuran disimpan sampai dipakai?",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 32),

                              // Langkah-langkah sistem iuran
                              Wrap(
                                runSpacing: 24,
                                spacing: 24,
                                alignment: WrapAlignment.center,
                                children: [
                                  BuildStep(
                                    icon: Icons.payment,
                                    title:
                                        "1. Proses Pembayaran Iuran kepada Bendahara RT",
                                    desc:
                                        "Setiap warga di lingkungan RT diwajibkan untuk membayar iuran kepada Bendahara RT masing-masing. Pembayaran ini dapat dilakukan secara tunai maupun melalui metode lain yang telah disepakati.",
                                  ),
                                  BuildStep(
                                    icon: Icons.savings,
                                    title:
                                        "2. Penyimpanan Dana oleh Bendahara RT",
                                    desc:
                                        "Setelah menerima iuran dari warga, Bendahara RT menyimpan uang tersebut sementara sebelum disalurkan. Selain itu bendahara wajib mencatat terlebih dahulu uang yang telah di setor.",
                                  ),
                                  BuildStep(
                                    icon: Icons.sync_alt,
                                    title:
                                        "3. Distribusi Dana ke Kas RT dan Kas RW",
                                    desc:
                                        "Dalam periode tertentu (misalnya setiap bulan), uang yang terkumpul akan dibagi sesuai dengan kesepakatan yang telah ditentukan. Sebagian dana digunakan dan disimpan oleh kas RT untuk kebutuhan tingkat RT, sementara sebagian lainnya akan disetorkan ke kas RW sebagai kontribusi seluruh RT dalam satu wilayah RW.",
                                  ),
                                  BuildStep(
                                    icon: Icons.receipt_long,
                                    title:
                                        "4. Pencatatan dan Pendataan Keuangan",
                                    desc:
                                        "Setiap transaksi yang dilakukan, baik penerimaan iuran maupun distribusi ke kas RW, akan dicatat dalam sistem atau buku kas resmi. Pencatatan ini bertujuan untuk menjaga transparansi dan akuntabilitas dalam pengelolaan keuangan, sehingga semua pihak yang berkepentingan dapat mengetahui kondisi keuangan dengan jelas.",
                                  ),
                                  BuildStep(
                                    icon: Icons.people,
                                    title:
                                        "5. Pemanfaatan Dana untuk Keperluan Masyarakat",
                                    desc:
                                        "Dana yang sudah terkumpul dalam kas RT dan kas RW dapat digunakan untuk berbagai kebutuhan, seperti kegiatan sosial, perbaikan lingkungan, atau acara rutin masyarakat lainnya yang telah disepakati bersama.",
                                  ),
                                  BuildStep(
                                    icon: Icons.assignment,
                                    title:
                                        "6. Pencatatan dan Pelaporan Setiap Pengeluaran",
                                    desc:
                                        "Setiap pengeluaran dana, termasuk biaya untuk kegiatan, fasilitas umum, atau kebutuhan warga lainnya wajib dicatat secara rinci, termasuk bukti transaksinya. Pencatatan ini penting agar warga bisa mengetahui bagaimana iuran mereka digunakan.",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Bagian Tanya WhatsApp
                        Container(
                          color: AppColors.greenPrimary,
                          padding: const EdgeInsets.all(24),
                          width: double.infinity,
                          child: Column(
                            children: [
                              const Text(
                                "Ada yang ingin kamu tanyakan?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.brownAccent,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Kami siap membantu anda dengan sebaik-baiknya menggunakan layanan kami melewati nomor whatsapp yang dapat dihubungi. kamu dapat menanyakan apa saja tentang RW 20 Rancamanyar Regency 2 dengan klik link dibawah!!",
                                style: TextStyle(color: AppColors.textDark),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.background,
                                  foregroundColor: AppColors.textDark,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                onPressed: () {
                                  launchUrl(
                                      Uri.parse("https://wa.me/6282115452003"));
                                },
                                child: const Text("Kirim Pesan"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: GetBuilder<DashboardController>(
                    builder: (controller) {
                      return FutureBuilder<List<dynamic>>(
                        // Fetch both data sources simultaneously
                        future: Future.wait([
                          controller.fetchKegiatan(),
                          controller.fetchKegiatanRt()
                        ]),
                        builder: (context, snapshot) {
                          // Handle loading state
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              controller.isLoadingKegiatan.value ||
                              controller.isLoadingKegiatanRt.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          // Handle error state for either data source
                          else if (snapshot.hasError ||
                              controller.kegiatanError.value != null ||
                              controller.kegiatanRtError.value != null) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.error_outline,
                                      size: 60, color: Colors.red),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Terjadi kesalahan: ${snapshot.error ?? controller.kegiatanError.value ?? controller.kegiatanRtError.value}",
                                    style: const TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () =>
                                            controller.refreshKegiatan(),
                                        child: const Text("Refresh RW"),
                                      ),
                                      const SizedBox(width: 16),
                                      ElevatedButton(
                                        onPressed: () =>
                                            controller.refreshKegiatanRt(),
                                        child: const Text("Refresh RT"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }

                          // If both lists are empty
                          else if (controller.kegiatanList.isEmpty &&
                              controller.kegiatanRtList.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.event_busy,
                                      size: 60, color: Colors.grey),
                                  const SizedBox(height: 16),
                                  const Text(
                                    "Tidak ada kegiatan yang tersedia saat ini",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }

                          // Display both RW and RT activities
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: Text(
                                    "Kegiatan Warga",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.brownAccent,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Center(
                                  child: Text(
                                    "Daftar kegiatan yang akan diadakan di lingkungan RW 20",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 24),

                                // RW Activities Section
                                if (controller.kegiatanList.isNotEmpty) ...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: const Text(
                                      "Kegiatan RW 20",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greenPrimary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    itemCount: controller.kegiatanList.length,
                                    itemBuilder: (context, index) {
                                      final kegiatan =
                                          controller.kegiatanList[index];
                                      return Card(
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: AppColors.greenPrimary,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.background,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          controller.formatDate(
                                                              kegiatan.tanggalKegiatan ??
                                                                  ""),
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Text(
                                                          controller.formatTime(
                                                              kegiatan.jamKegiatan ??
                                                                  ""),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          kegiatan.namaKegiatan ??
                                                              "Tanpa Nama",
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.location_on,
                                                              size: 16,
                                                              color: Colors
                                                                  .white70,
                                                            ),
                                                            const SizedBox(
                                                                width: 4),
                                                            Expanded(
                                                              child: Text(
                                                                kegiatan.tempatKegiatan ??
                                                                    "Lokasi tidak tersedia",
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white70,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: _getStatusColor(
                                                          kegiatan.status ??
                                                              ""),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    child: Text(
                                                      kegiatan.status ?? "N/A",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Deskripsi:",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    controller.stripHtmlTags(
                                                        kegiatan.deskripsi ??
                                                            "Tidak ada deskripsi"),
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ] else ...[
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Icon(Icons.event_busy,
                                              size: 40, color: Colors.grey),
                                          SizedBox(height: 8),
                                          Text(
                                            "Tidak ada kegiatan RW yang tersedia saat ini",
                                            style: TextStyle(fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],

                                const SizedBox(height: 32),

                                // RT Activities Section
                                if (controller.kegiatanRtList.isNotEmpty) ...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: const Text(
                                      "Kegiatan RT",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.brownAccent,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    itemCount: controller.kegiatanRtList.length,
                                    itemBuilder: (context, index) {
                                      final kegiatan =
                                          controller.kegiatanRtList[index];
                                      return Card(
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: AppColors.brownAccent,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.background,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          controller.formatDate(
                                                              kegiatan.tanggalKegiatan ??
                                                                  ""),
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Text(
                                                          controller.formatTime(
                                                              kegiatan.jamKegiatan ??
                                                                  ""),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          kegiatan.namaKegiatan ??
                                                              "Tanpa Nama",
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.location_on,
                                                              size: 16,
                                                              color: Colors
                                                                  .white70,
                                                            ),
                                                            const SizedBox(
                                                                width: 4),
                                                            Expanded(
                                                              child: Text(
                                                                kegiatan.tempatKegiatan ??
                                                                    "Lokasi tidak tersedia",
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white70,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.home,
                                                              size: 16,
                                                              color: Colors
                                                                  .white70,
                                                            ),
                                                            const SizedBox(
                                                                width: 4),
                                                            Text(
                                                              "RT ${kegiatan.rtId}",
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white70,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: _getStatusColor(
                                                          kegiatan.status ??
                                                              ""),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    child: Text(
                                                      kegiatan.status ?? "N/A",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Deskripsi:",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    controller.stripHtmlTags(
                                                        kegiatan.deskripsi ??
                                                            "Tidak ada deskripsi"),
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ] else ...[
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Icon(Icons.event_busy,
                                              size: 40, color: Colors.grey),
                                          SizedBox(height: 8),
                                          Text(
                                            "Tidak ada kegiatan RT yang tersedia saat ini",
                                            style: TextStyle(fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String text) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: AppColors.greenPrimary.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
