import 'package:clean_architecture_tdd/domain/usecases/authentication_usecase.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';

import 'package:test/test.dart';

class RemouteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemouteAuthentication({required this.httpClient, required this.url});

  Future<void>? auth(AuthenticationParams params) async {
    final body = {'email': params.email,'password':params.password};
    await httpClient.request(url: url,method: 'POST',body: body);
  }
}

abstract class HttpClient {
  Future<void>? request({required String url,required String method,Map body});
}

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late HttpClientMock httpClient;
  late String url;
  late RemouteAuthentication sut;

  setUp((){
     httpClient = HttpClientMock();
     url = faker.internet.httpUrl();
     sut = RemouteAuthentication(httpClient: httpClient, url: url,);
  });
  
  test('Should call HttpClient with correct URL', () async {
    final params = AuthenticationParams(email: faker.internet.email(), password: faker.internet.password());

    await sut.auth(params);

    verify(httpClient.request(url: url,method:'POST',body: {'email':params.email,'password':params.password}));
  });
}
