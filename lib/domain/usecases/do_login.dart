import 'package:approval_app/domain/entities/login.dart';
import 'package:approval_app/domain/repositories/approval_repository.dart';
import 'package:approval_app/utils/failure.dart';
import 'package:dartz/dartz.dart';

class DoLogin{
  final ApprovalRepository repository;

  DoLogin(this.repository);

  Future<Either<Failure,Login>> execute(String loginId, String client, String password){
    return repository.doLogin(loginId,client,password);
  }
}