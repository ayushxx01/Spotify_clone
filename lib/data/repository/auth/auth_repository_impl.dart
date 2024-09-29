import 'package:dartz/dartz.dart';
import 'package:rockify/data/models/auth/create_user_req.dart';
import 'package:rockify/data/models/auth/signin_user_req.dart';
import 'package:rockify/data/sources/auth/auth_firebase_service.dart';
import 'package:rockify/domain/repository/auth/auth.dart';
import 'package:rockify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

//auth repository implementation
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
