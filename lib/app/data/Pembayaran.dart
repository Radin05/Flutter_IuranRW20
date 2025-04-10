class PembayaranResponse {
  bool? success;
  String? message;
  List<Pembayarans>? pembayarans;

  PembayaranResponse({this.success, this.message, this.pembayarans});

  PembayaranResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['pembayarans'] != null) {
      pembayarans = <Pembayarans>[];
      json['pembayarans'].forEach((v) {
        pembayarans!.add(new Pembayarans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.pembayarans != null) {
      data['pembayarans'] = this.pembayarans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pembayarans {
  int? id;
  String? noKkKeluarga;
  String? sejumlah;
  String? tglPembayaran;
  int? year;
  int? month;
  String? createdAt;
  String? updatedAt;
  Keluarga? keluarga;

  Pembayarans(
      {this.id,
      this.noKkKeluarga,
      this.sejumlah,
      this.tglPembayaran,
      this.year,
      this.month,
      this.createdAt,
      this.updatedAt,
      this.keluarga});

  Pembayarans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noKkKeluarga = json['no_kk_keluarga'];
    sejumlah = json['sejumlah'];
    tglPembayaran = json['tgl_pembayaran'];
    year = json['year'];
    month = json['month'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    keluarga = json['keluarga'] != null
        ? new Keluarga.fromJson(json['keluarga'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_kk_keluarga'] = this.noKkKeluarga;
    data['sejumlah'] = this.sejumlah;
    data['tgl_pembayaran'] = this.tglPembayaran;
    data['year'] = this.year;
    data['month'] = this.month;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.keluarga != null) {
      data['keluarga'] = this.keluarga!.toJson();
    }
    return data;
  }
}

class Keluarga {
  int? id;
  String? noKk;
  String? namaKeluarga;
  String? alamat;
  String? noTelp;
  int? rtId;
  String? createdAt;
  String? updatedAt;

  Keluarga(
      {this.id,
      this.noKk,
      this.namaKeluarga,
      this.alamat,
      this.noTelp,
      this.rtId,
      this.createdAt,
      this.updatedAt});

  Keluarga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['id'] = this.id;
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
