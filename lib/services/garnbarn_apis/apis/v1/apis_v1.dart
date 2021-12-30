import 'dart:convert';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/errors/api_v1_error.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/api_methods.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

// Set the Prefix of the GarnBarnAPI
// Ex. https://example.com
// Don't include the `/` at the end
const apiPrefix = "https://garnbarn-api.sirateek.dev";

class ApisV1 {
  final User _firebaseUser;
  late http.Client _httpClient;

  ApisV1(this._firebaseUser, {http.Client? httpClient}) {
    _httpClient = httpClient ?? http.Client();
  }

  Future<ApiV1Response> sendRequest(ApiMethods method, String apiPath,
      {Map<String, String>? headers, Map<String, String>? body}) async {
    var url = Uri.parse(apiPrefix + apiPath);
    // Auto add the Authentication Header.
    headers ??= {};
    String idToken = await _firebaseUser.getIdToken();
    headers["Authentication"] = "Bearer " + idToken;
    // Parse body to be the JSON.
    String? parsedBody;
    if (body != null) {
      parsedBody = jsonEncode(body);
    }
    // Switch implement hte case based in the ApiMethods.
    http.Response response;
    switch (method) {
      case ApiMethods.GET:
        response = await _httpClient.get(url, headers: headers);
        break;
      case ApiMethods.POST:
        response =
            await _httpClient.post(url, headers: headers, body: parsedBody);
        break;
      case ApiMethods.PATCH:
        response =
            await _httpClient.patch(url, headers: headers, body: parsedBody);
        break;
      default:
        throw Exception("Unsupported ApiMethods");
    }
    _httpClient.close();
    return ApiV1Response(response.statusCode, response.body);
  }
}

class ApiV1Response {
  final int statusCode;
  final String body;

  ApiV1Response(this.statusCode, this.body);

  getMapBody() {
    return jsonDecode(body);
  }

  bool verifySuccess() {
    if (statusCode != 200) {
      throw ApiV1Error(getMapBody());
    }
    return true;
  }
}
