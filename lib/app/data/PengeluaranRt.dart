class PengeluaranRtResponse {
  bool? success;
  String? message;
  List<PengeluaransRt>? pengeluarans;

  PengeluaranRtResponse({this.success, this.message, this.pengeluarans});

  PengeluaranRtResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['pengeluarans'] != null) {
      pengeluarans = <PengeluaransRt>[];
      json['pengeluarans'].forEach((v) {
        pengeluarans!.add(new PengeluaransRt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.pengeluarans != null) {
      data['pengeluarans'] = this.pengeluarans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PengeluaransRt {
  int? id;
  String? nominal;
  int? kegiatanId;
  String? keterangan;
  String? tglPengeluaran;
  int? rtId;
  String? createdAt;
  String? updatedAt;

  PengeluaransRt(
      {this.id,
      this.nominal,
      this.kegiatanId,
      this.keterangan,
      this.tglPengeluaran,
      this.rtId,
      this.createdAt,
      this.updatedAt});

  PengeluaransRt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nominal = json['nominal'];
    kegiatanId = json['kegiatan_id'];
    keterangan = json['keterangan'];
    tglPengeluaran = json['tgl_pengeluaran'];
    rtId = json['rt_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nominal'] = this.nominal;
    data['kegiatan_id'] = this.kegiatanId;
    data['keterangan'] = this.keterangan;
    data['tgl_pengeluaran'] = this.tglPengeluaran;
    data['rt_id'] = this.rtId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
