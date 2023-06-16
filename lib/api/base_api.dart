import 'package:http/http.dart' as http;
class BaseApi {
  static http.Response noResponse({String? msg}) {
    return http.Response(msg ?? "no response", 204);
  }
  static http.StreamedResponse noStreamResponse() {
    return http.StreamedResponse(Stream.empty(), 204);
  }
}