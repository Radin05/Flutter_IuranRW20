class KegiatanResponse {
  String? message;
  List<Kegiatan>? kegiatan;

  KegiatanResponse({this.message, this.kegiatan});

  KegiatanResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['kegiatan'] != null) {
      kegiatan = <Kegiatan>[];
      json['kegiatan'].forEach((v) {
        kegiatan!.add(new Kegiatan.fromJson(v));
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

class Kegiatan {
  int? id;
  String? namaKegiatan;
  String? deskripsi;
  String? tanggalKegiatan;
  String? jamKegiatan;
  String? status;
  int? rtId;
  String? createdAt;
  String? updatedAt;

  Kegiatan(
      {this.id,
      this.namaKegiatan,
      this.deskripsi,
      this.tanggalKegiatan,
      this.jamKegiatan,
      this.status,
      this.rtId,
      this.createdAt,
      this.updatedAt});

  Kegiatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKegiatan = json['nama_kegiatan'];
    deskripsi = json['deskripsi'];
    tanggalKegiatan = json['tanggal_kegiatan'];
    jamKegiatan = json['jam_kegiatan'];
    status = json['status'];
    rtId = json['rt_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kegiatan'] = this.namaKegiatan;
    data['deskripsi'] = this.deskripsi;
    data['tanggal_kegiatan'] = this.tanggalKegiatan;
    data['jam_kegiatan'] = this.jamKegiatan;
    data['status'] = this.status;
    data['rt_id'] = this.rtId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
