class KasRwResponse {
  bool? success;
  KasRw? kasRw;

  KasRwResponse({this.success, this.kasRw});

  KasRwResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    kasRw = json['kas_rw'] != null ? KasRw.fromJson(json['kas_rw']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (kasRw != null) {
      data['kas_rw'] = kasRw!.toJson();
    }
    return data;
  }
}

class KasRw {
  int? id;
  int? pembayaranId;
  String? jumlahKasRw;
  int? pengeluaranKasRwId;
  int? uangTambahanKasId;
  String? createdAt;
  String? updatedAt;

  KasRw({
    this.id,
    this.pembayaranId,
    this.jumlahKasRw,
    this.pengeluaranKasRwId,
    this.uangTambahanKasId,
    this.createdAt,
    this.updatedAt,
  });

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pembayaran_id'] = pembayaranId;
    data['jumlah_kas_rw'] = jumlahKasRw;
    data['pengeluaran_kas_rw_id'] = pengeluaranKasRwId;
    data['uang_tambahan_kas_id'] = uangTambahanKasId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
