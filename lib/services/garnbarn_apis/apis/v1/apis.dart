import 'dart:convert';
import 'package:garnbarn_mobile/services/garnbarn_apis/types/api_methods.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

// Set the Prefix of the GarnBarnAPI
// Ex. https://example.com
// Don't include the `/` at the end
const apiPrefix = "https://garnbarn-api.sirateek.dev";

abstract class Apis {
  final User _firebaseUser;

  const Apis(this._firebaseUser);

  Future<http.Response> sendRequest(ApiMethods method, String apiPath,
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
    switch (method) {
      case ApiMethods.GET:
        return http.get(url, headers: headers);
      case ApiMethods.POST:
        return http.post(url, headers: headers, body: parsedBody);
      case ApiMethods.PATCH:
        return http.patch(url, headers: headers, body: parsedBody);
      default:
        throw Exception("Unsupported ApiMethods");
    }
  }
}
