import 'package:approval_app/domain/repositories/approval_repository.dart';
import 'package:approval_app/utils/failure.dart';
import 'package:dartz/dartz.dart';

class SaveApproval{
  final ApprovalRepository repository;

  SaveApproval(this.repository);

  Future<Either<Failure, bool>> execute(int companyId, String module, String token, int id, String action, String remark){
    return repository.saveApproval(companyId, module, token, id,action,remark);
  }

}