import 'package:approval_app/domain/entities/detail_approval.dart';
import 'package:approval_app/domain/repositories/approval_repository.dart';
import 'package:approval_app/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetDetailApproval {
  final ApprovalRepository repository;

  GetDetailApproval(this.repository);

  Future<Either<Failure, DetailApproval>> execute(
      int companyId, String module, String token, int id) async {
    return repository.getDetailApproval(companyId, module, token, id);
  }
}
