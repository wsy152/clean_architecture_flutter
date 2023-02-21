// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_tdd/domain/entities/account_entity.dart';

abstract class AuthenticationUseCase {
  Future<AccountEntity> auth(AuthenticationParams params);
}


class AuthenticationParams {
  final String email;
  final String password;
  AuthenticationParams({
    required this.email,
    required this.password,
  });
}
