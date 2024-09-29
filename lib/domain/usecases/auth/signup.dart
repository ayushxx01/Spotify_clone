import 'package:dartz/dartz.dart';
import 'package:rockify/core/usecases/usecase.dart';
import 'package:rockify/data/models/auth/create_user_req.dart';
import 'package:rockify/domain/repository/auth/auth.dart';
import 'package:rockify/service_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
