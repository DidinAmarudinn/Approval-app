import 'dart:convert';

import 'package:approval_app/data/models/approval_model.dart';
import 'package:approval_app/data/models/approval_response.dart';
import 'package:approval_app/data/models/detail_approval_model.dart';
import 'package:approval_app/data/models/login_model.dart';
import 'package:approval_app/data/models/module_model.dart';
import 'package:approval_app/data/models/module_response.dart';
import 'package:http/http.dart' as http;

import '../../utils/exception.dart';

abstract class ApprovalRemoteDataSource {
  Future<LoginModel> doLogin(String loginId, String clientId, String password);
  Future<List<ModuleModel>> getModule(int companyId, String token);
  Future<List<ApprovalModel>> getApproval(
      int companyId, String module, String token);
  Future<DetailApprovalModel> getDetailApproval(
      int companyId, String module, String token, int id);
  Future<bool> saveApproval(int companyId, String module, String token, int id,
      String action, String remark);
}

class ApprovalRemoteDataSourceImpl extends ApprovalRemoteDataSource {
  static const apiKey = 'tQyHKJuQvJFIdxsSAAIc0BCDAkVIIrnH';
  static const baseUrl = 'http://123.100.226.155';
  final http.Client client;

  ApprovalRemoteDataSourceImpl({required this.client});
  @override
  Future<LoginModel> doLogin(
      String loginId, String clientId, String password) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('$baseUrl/nativeapi/approval/login.php?apikey=$apiKey'));
    request.fields
        .addAll({'login': loginId, 'password': password, 'client': clientId});
    var response = await client.send(request);

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var dataResponse = jsonDecode(data);

      if (dataResponse["status"] == true) {
        return LoginModel.fromJson(dataResponse);
      } else {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ModuleModel>> getModule(int companyId, String token) async {
    final response = await client.get(Uri.parse(
        '$baseUrl/nativeapi/approval/main.php?token=$token&company=$companyId'));

    if (response.statusCode == 200) {
      return ModuleResponse.fromJson(json.decode(response.body)).moduleList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ApprovalModel>> getApproval(
      int companyId, String module, String token) async {
    final response = await client.get(Uri.parse(
        '$baseUrl/nativeapi/approval/list.php?token=$token&company=$companyId&module=$module'));

    if (response.statusCode == 200) {
      return ApprovalResponse.fromJson(json.decode(response.body)).approvalList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailApprovalModel> getDetailApproval(
      int companyId, String module, String token, int id) async {
    final response = await client.get(Uri.parse(
        '$baseUrl/nativeapi/approval/view.php?token=$token&company=$companyId&module=$module&id=$id'));
    if (response.statusCode == 200) {
      return DetailApprovalModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<bool> saveApproval(int companyId, String module, String token, int id,
      String action, String remark) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '$baseUrl/nativeapi/approval/post.php?token=$token&company=$companyId&module=$module&id=$id'));
    request.fields.addAll({'state': action, 'remark': remark});
    print(action + remark);
    var response = await client.send(request);
    print(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.reasonPhrase);
      throw ServerException();
    }
  }
}
