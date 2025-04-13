import 'package:flutter/material.dart';
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
                Center(child: _buildCard("Riwayat Iuran")),
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
