import 'package:approval_app/domain/entities/approval.dart';
import 'package:approval_app/domain/repositories/approval_repository.dart';
import 'package:approval_app/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetListApproval{
  final ApprovalRepository repository;

  GetListApproval(this.repository);

  Future<Either<Failure, List<Approval>>> execute(int companyId, String module, String token){
    return repository.getApproval(companyId, module, token);
  }
}