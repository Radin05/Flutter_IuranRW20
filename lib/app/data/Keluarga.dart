class KeluargaResponse {
  String? message;
  List<Keluargas>? keluargas;

  KeluargaResponse({this.message, this.keluargas});

  KeluargaResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['keluargas'] != null) {
      keluargas = <Keluargas>[];
      json['keluargas'].forEach((v) {
        keluargas!.add(new Keluargas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.keluargas != null) {
      data['keluargas'] = this.keluargas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Keluargas {
  String? noKk;
  String? namaKeluarga;
  String? alamat;
  String? noTelp;
  int? rtId;
  String? createdAt;
  String? updatedAt;

  Keluargas(
      {this.noKk,
      this.namaKeluarga,
      this.alamat,
      this.noTelp,
      this.rtId,
      this.createdAt,
      this.updatedAt});

  Keluargas.fromJson(Map<String, dynamic> json) {
    noKk = json['no_kk'];
    namaKeluarga = json['nama_keluarga'];
    alamat = json['alamat'];
    noTelp = json['no_telp'];
    rtId = json['rt_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_kk'] = this.noKk;
    data['nama_keluarga'] = this.namaKeluarga;
    data['alamat'] = this.alamat;
    data['no_telp'] = this.noTelp;
    data['rt_id'] = this.rtId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}