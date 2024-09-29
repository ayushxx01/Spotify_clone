import 'package:dartz/dartz.dart';
import 'package:rockify/core/usecases/usecase.dart';
import 'package:rockify/data/models/auth/signin_user_req.dart';
import 'package:rockify/domain/repository/auth/auth.dart';
import 'package:rockify/service_locator.dart';

class SignInUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
