import 'dart:convert';
import 'dart:io';
import 'package:approval_app/data/datasource/approval_local_datasource.dart';
import 'package:approval_app/data/datasource/approval_remote_datasource.dart';
import 'package:approval_app/domain/entities/approval.dart';
import 'package:approval_app/domain/entities/detail_approval.dart';
import 'package:approval_app/domain/entities/login.dart';
import 'package:approval_app/domain/entities/module.dart';
import 'package:approval_app/domain/repositories/approval_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:approval_app/utils/failure.dart';

import '../../utils/exception.dart';

class ApprovalRepositoryImpl extends ApprovalRepository {
  final ApprovalRemoteDataSource remoteDataSource;
  final ApprovalLocalDataSource localDataSource;

  ApprovalRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, Login>> doLogin(
      String loginId, String client, String password) async {
    try {
      final result = await remoteDataSource.doLogin(loginId, client, password);
      await localDataSource.saveDataLogin(jsonEncode(result.toJson()));
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Login>> getDataLogin() async {
    final data = await localDataSource.getData();
    return Right(data!.toEntity());
  }

  @override
  Future<Either<Failure, List<Module>>> getModule(
      int companyId, String token) async {
    try {
      final result = await remoteDataSource.getModule(companyId, token);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure("failed connect to the network"));
    }
  }

  @override
  Future<Either<Failure, List<Approval>>> getApproval(
      int companyId, String module, String token) async {
    try {
      final result =
          await remoteDataSource.getApproval(companyId, module, token);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure("failed connect to the network"));
    }
  }

  @override
  Future<Either<Failure, DetailApproval>> getDetailApproval(
      int companyId, String module, String token, int id) async {
    try {
      final result = await remoteDataSource.getDetailApproval(
          companyId, module, token, id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure("failed connect to the network"));
    }
  }
}
