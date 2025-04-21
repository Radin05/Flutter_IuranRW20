class KegiatanRwResponse {
  String? message;
  List<KegiatanRw>? kegiatan;

  KegiatanRwResponse({this.message, this.kegiatan});

  KegiatanRwResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['kegiatan'] != null) {
      kegiatan = <KegiatanRw>[];
      json['kegiatan'].forEach((v) {
        kegiatan!.add(new KegiatanRw.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.kegiatan != null) {
      data['kegiatan'] = this.kegiatan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KegiatanRw {
  int? id;
  String? namaKegiatan;
  String? tempatKegiatan;
  String? deskripsi;
  String? tanggalKegiatan;
  String? jamKegiatan;
  String? status;
  String? createdAt;
  String? updatedAt;

  KegiatanRw(
      {this.id,
      this.namaKegiatan,
      this.tempatKegiatan,
      this.deskripsi,
      this.tanggalKegiatan,
      this.jamKegiatan,
      this.status,
      this.createdAt,
      this.updatedAt});

  KegiatanRw.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKegiatan = json['nama_kegiatan'];
    tempatKegiatan = json['tempat_kegiatan'];
    deskripsi = json['deskripsi'];
    tanggalKegiatan = json['tanggal_kegiatan'];
    jamKegiatan = json['jam_kegiatan'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kegiatan'] = this.namaKegiatan;
    data['tempat_kegiatan'] = this.tempatKegiatan;
    data['deskripsi'] = this.deskripsi;
    data['tanggal_kegiatan'] = this.tanggalKegiatan;
    data['jam_kegiatan'] = this.jamKegiatan;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
