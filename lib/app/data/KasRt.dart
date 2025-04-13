class KasRtResponse {
  bool? success;
  KasRt? kasRt;

  KasRtResponse({this.success, this.kasRt});

  KasRtResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    kasRt = json['kas_rt'] != null ? new KasRt.fromJson(json['kas_rt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.kasRt != null) {
      data['kas_rt'] = this.kasRt!.toJson();
    }
    return data;
  }
}

class KasRt {
  int? id;
  int? rtId;
  int? pembayaranId;
  int? pengeluaranKasRtId;
  int? uangTambahanKasId;
  String? jumlahKasRt;
  String? createdAt;
  String? updatedAt;
  Rt? rt;

  KasRt(
      {this.id,
      this.rtId,
      this.pembayaranId,
      this.pengeluaranKasRtId,
      this.uangTambahanKasId,
      this.jumlahKasRt,
      this.createdAt,
      this.updatedAt,
      this.rt});

  KasRt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rtId = json['rt_id'];
    pembayaranId = json['pembayaran_id'];
    pengeluaranKasRtId = json['pengeluaran_kas_rt_id'];
    uangTambahanKasId = json['uang_tambahan_kas_id'];
    jumlahKasRt = json['jumlah_kas_rt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rt = json['rt'] != null ? new Rt.fromJson(json['rt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rt_id'] = this.rtId;
    data['pembayaran_id'] = this.pembayaranId;
    data['pengeluaran_kas_rt_id'] = this.pengeluaranKasRtId;
    data['uang_tambahan_kas_id'] = this.uangTambahanKasId;
    data['jumlah_kas_rt'] = this.jumlahKasRt;
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
