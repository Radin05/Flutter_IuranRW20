  class KasRwResponse {
  bool? success;
  KasRw? kasRw;

  KasRwResponse({this.success, this.kasRw});

  KasRwResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    kasRw = json['kas_rw'] != null ? new KasRw.fromJson(json['kas_rw']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.kasRw != null) {
      data['kas_rw'] = this.kasRw!.toJson();
    }
    return data;
  }
}

class KasRw {
  int? id;
  Null pembayaranId;
  String? jumlahKasRw;
  Null pengeluaranKasRwId;
  Null uangTambahanKasId;
  String? createdAt;
  String? updatedAt;

  KasRw(
      {this.id,
      this.pembayaranId,
      this.jumlahKasRw,
      this.pengeluaranKasRwId,
      this.uangTambahanKasId,
      this.createdAt,
      this.updatedAt});

  KasRw.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pembayaranId = json['pembayaran_id'];
    jumlahKasRw = json['jumlah_kas_rw'];
    pengeluaranKasRwId = json['pengeluaran_kas_rw_id'];
    uangTambahanKasId = json['uang_tambahan_kas_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pembayaran_id'] = this.pembayaranId;
    data['jumlah_kas_rw'] = this.jumlahKasRw;
    data['pengeluaran_kas_rw_id'] = this.pengeluaranKasRwId;
    data['uang_tambahan_kas_id'] = this.uangTambahanKasId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
