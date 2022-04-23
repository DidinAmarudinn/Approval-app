import 'package:approval_app/domain/entities/module.dart';
import 'package:approval_app/domain/repositories/approval_repository.dart';
import 'package:approval_app/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetModele{
  final ApprovalRepository repository;

  GetModele(this.repository);

  Future<Either<Failure, List<Module>>> execute(int companyId, String token){
    return repository.getModule(companyId, token);
  }
}