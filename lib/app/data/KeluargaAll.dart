class AllKeluargaResponse {
  String? message;
  List<Keluargas>? keluargas;

  AllKeluargaResponse({this.message, this.keluargas});

  AllKeluargaResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? noKk;
  String? namaKeluarga;
  String? alamat;
  String? noTelp;
  int? rtId;
  String? createdAt;
  String? updatedAt;
  Rt? rt;

  Keluargas(
      {this.id,
      this.noKk,
      this.namaKeluarga,
      this.alamat,
      this.noTelp,
      this.rtId,
      this.createdAt,
      this.updatedAt,
      this.rt});

  Keluargas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noKk = json['no_kk'];
    namaKeluarga = json['nama_keluarga'];
    alamat = json['alamat'];
    noTelp = json['no_telp'];
    rtId = json['rt_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rt = json['rt'] != null ? new Rt.fromJson(json['rt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_kk'] = this.noKk;
    data['nama_keluarga'] = this.namaKeluarga;
    data['alamat'] = this.alamat;
    data['no_telp'] = this.noTelp;
    data['rt_id'] = this.rtId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.rt != null) {
      data['rt'] = this.rt!.toJson();
    }
    return data;
  }
}

class Rt {
  int? id;
  String? namaRT;
  String? createdAt;
  String? updatedAt;

  Rt({this.id, this.namaRT, this.createdAt, this.updatedAt});

  Rt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaRT = json['nama_RT'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_RT'] = this.namaRT;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
