class ProfileResponse {
  User? user;

  ProfileResponse({this.user});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? noKkKeluarga;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? role;
  int? rtId;
  String? foto;
  String? kedudukan;
  String? createdAt;
  String? updatedAt;
  String? loginTime;
  Keluarga? keluarga;
  Rt? rt;

  User(
      {this.id,
      this.noKkKeluarga,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.role,
      this.rtId,
      this.foto,
      this.kedudukan,
      this.createdAt,
      this.updatedAt,
      this.loginTime,
      this.keluarga,
      this.rt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noKkKeluarga = json['no_kk_keluarga'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    rtId = json['rt_id'];
    foto = json['foto'];
    kedudukan = json['kedudukan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    loginTime = json['login_time'];
    keluarga = json['keluarga'] != null
        ? new Keluarga.fromJson(json['keluarga'])
        : null;
    rt = json['rt'] != null ? new Rt.fromJson(json['rt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_kk_keluarga'] = this.noKkKeluarga;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['rt_id'] = this.rtId;
    data['foto'] = this.foto;
    data['kedudukan'] = this.kedudukan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['login_time'] = this.loginTime;
    if (this.keluarga != null) {
      data['keluarga'] = this.keluarga!.toJson();
    }
    if (this.rt != null) {
      data['rt'] = this.rt!.toJson();
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
