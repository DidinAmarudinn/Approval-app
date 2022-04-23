import 'package:approval_app/domain/entities/login.dart';
import 'package:approval_app/domain/repositories/approval_repository.dart';
import 'package:approval_app/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetDataLogin{
  final ApprovalRepository repository;

  GetDataLogin({required this.repository});

  Future<Either<Failure, Login>> execute(){
    return repository.getDataLogin();
  }
}