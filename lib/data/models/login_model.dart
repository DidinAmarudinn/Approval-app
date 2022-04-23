import 'package:approval_app/domain/entities/login.dart';
import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  const LoginModel({
    required this.status,
    required this.data,
  });

  final bool status;
  final DataModel data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        data: DataModel.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": data.toJson(),
      };

  Login toEntity() => Login(status: status, data: data.toEntity());

  @override
  List<Object?> get props => [status, data];
}

class DataModel {
  DataModel({
    this.usrid,
    this.uname,
    this.phone,
    this.email,
    this.token,
    this.client,
    this.manifest,
  });

  int? usrid;
  String? uname;
  String? phone;
  String? email;
  String? token;
  ClientModel? client;
  ManifestModel? manifest;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        usrid: json["usrid"],
        uname: json["uname"],
        phone: json["phone"],
        email: json["email"],
        token: json["token"],
        client: ClientModel.fromJson(json["client"]),
        manifest: ManifestModel.fromJson(json["manifest"]),
      );

  Map<String, dynamic> toJson() => {
        "usrid": usrid,
        "uname": uname,
        "phone": phone,
        "email": email,
        "token": token,
        "client": client?.toJson(),
        "manifest": manifest?.toJson(),
      };

  Data toEntity() => Data(
      usrid: usrid,
      uname: uname,
      phone: phone,
      email: email,
      token: token,
      client: client?.toEntity(),
      manifest: manifest?.toEntity());
}

class ClientModel {
  ClientModel({
    this.code,
    this.name,
    this.logo,
    required this.company,
  });

  String? code;
  String? name;
  String? logo;
  List<CompanyModel> company;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        code: json["code"],
        name: json["name"],
        logo: json["logo"],
        company: List<CompanyModel>.from(
            json["company"].map((x) => CompanyModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "logo": logo,
        "company": List<dynamic>.from(company.map((x) => x.toJson()))
      };
  Client toEntity() =>
      Client(code: code, company: company.map((e) => e.toEnitiy()).toList());
}

class CompanyModel {
  CompanyModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
  Company toEnitiy() => Company(name: name, id: id);
}

class ManifestModel {
  ManifestModel({
    this.version,
    this.appName,
    this.appLogo,
    this.themes,
  });

  String? version;
  String? appName;
  String? appLogo;
  ThemesModel? themes;

  factory ManifestModel.fromJson(Map<String, dynamic> json) => ManifestModel(
        version: json["version"],
        appName: json["appName"],
        appLogo: json["appLogo"],
        themes: ThemesModel.fromJson(json["themes"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "appName": appName,
        "appLogo": appLogo,
        "themes": themes?.toJson(),
      };
  Manifest toEntity() => Manifest(
        version: version,
        appLogo: appLogo,
        appName: appName,
        themes: themes?.toEntity(),
      );
}

class ThemesModel {
  ThemesModel({
    this.headerColor,
    this.buttonColor,
    this.dialogColor,
  });

  String? headerColor;
  String? buttonColor;
  String? dialogColor;

  factory ThemesModel.fromJson(Map<String, dynamic> json) => ThemesModel(
        headerColor: json["headerColor"],
        buttonColor: json["buttonColor"],
        dialogColor: json["dialogColor"],
      );

  Map<String, dynamic> toJson() => {
        "headerColor": headerColor,
        "buttonColor": buttonColor,
        "dialogColor": dialogColor,
      };

  Theming toEntity() => Theming(
        headerColor: headerColor,
        buttonColor: buttonColor,
        dialogColor: dialogColor,
      );
}
