import 'dart:io';

String baseUrl = "https://1531-154-222-6-244.ngrok-free.app";

String endPoint = '$baseUrl/api';

Future headers({bool isJson = false, String? idToken}) async {
  // final String _token = await SharedPreference.getToken();
  dynamic headers;
  if (isJson) {
    headers = {
      //  HttpHeaders.authorizationHeader: "Bearer $_token",
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      "idToken": idToken,
    };
    print(idToken);
  } else {
    headers = {
      // HttpHeaders.authorizationHeader: "Bearer $_token",
      HttpHeaders.acceptHeader: "application/json"
    };
  }
  return Future.value(headers);
}
