import 'package:clean_architecture_tdd/domain/entities/account_entity.dart';

abstract class AuthenticationUseCase{
  Future<AccountEntity> auth({required String email,required String password});
}