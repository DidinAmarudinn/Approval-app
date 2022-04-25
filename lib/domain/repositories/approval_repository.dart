import 'package:approval_app/domain/entities/approval.dart';
import 'package:approval_app/domain/entities/detail_approval.dart';
import 'package:approval_app/domain/entities/module.dart';
import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/login.dart';

abstract class ApprovalRepository {
  Future<Either<Failure, Login>> doLogin(
      String loginId, String client, String password);
  Future<Either<Failure, Login>> getDataLogin();
  Future<Either<Failure, List<Module>>> getModule(int companyId, String token);
  Future<Either<Failure, List<Approval>>> getApproval(
      int companyId, String module, String token);
  Future<Either<Failure, DetailApproval>> getDetailApproval(
      int companyId, String module, String token, int id);
  Future<Either<Failure, bool>> saveApproval(int companyId, String module,
      String token, int id, String action, String remark);
}
