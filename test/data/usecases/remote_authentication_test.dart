import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';

import 'package:test/test.dart';

class RemouteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemouteAuthentication({required this.httpClient, required this.url});

  Future<void>? auth() async {
    await httpClient.request(url: url,method: 'POST');
  }
}

abstract class HttpClient {
  Future<void>? request({required String url,required String method});
}

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late HttpClientMock httpClient;
  late String url;
  late RemouteAuthentication sut;

  setUp((){
     httpClient = HttpClientMock();
     url = faker.internet.httpUrl();
     sut = RemouteAuthentication(httpClient: httpClient, url: url);

  });
  test('Should call HttpClient with correct URL', () async {
    await sut.auth();

    verify(httpClient.request(url: url,method:'POST'));
  });
}
