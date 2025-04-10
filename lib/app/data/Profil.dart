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
  Null noKkKeluarga;
  String? name;
  String? email;
  Null emailVerifiedAt;
  String? role;
  int? rtId;
  String? foto;
  String? kedudukan;
  String? createdAt;
  String? updatedAt;
  Null loginTime;

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
      this.loginTime});

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
    return data;
  }
}
