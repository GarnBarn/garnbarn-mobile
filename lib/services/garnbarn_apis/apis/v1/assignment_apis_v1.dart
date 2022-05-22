import 'package:firebase_auth/firebase_auth.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/apis_v1.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/api_methods.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/assignment.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/bulk_api_response.dart';
import 'package:http/http.dart' as http;

class AssignmentApisV1 extends ApisV1 {
  final String _apiBaseUrl = "/api/v1/assignment";
  AssignmentApisV1(User firebaseUser, {http.Client? httpClient})
      : super(firebaseUser, httpClient: httpClient);

  /// Get the Assignment object with [id] from the GarnBarnApi
  Future<Assignment> get(int id) async {
    ApiV1Response response =
        await sendRequest(ApiMethods.GET, "$_apiBaseUrl/$id/");
    var responseMap = response.getMapBody();
    return Assignment.fromJson(responseMap);
  }

  /// Call Get all assignments API
  Future<BulkApiResponse<Assignment>> all(
      {bool? fromPresent, int? page}) async {
    // Convert parameters into URL Query Strings.
    String apiBaseUrlWithParams = _apiBaseUrl + "?";
    if (fromPresent != null) {
      apiBaseUrlWithParams += "fromPresent=" + fromPresent.toString() + "&";
    }
    if (page != null) {
      apiBaseUrlWithParams += "page=" + page.toString() + "&";
    }
    // Send request
    ApiV1Response response =
        await sendRequest(ApiMethods.GET, apiBaseUrlWithParams);
    var responseMap = response.getMapBody();
    // Convert the next and previous to be the callable function.
    if (responseMap["next"] != null) {
      var uri = Uri.parse(responseMap["next"]);

      responseMap["next"] = () {
        all(
            page: int.parse(uri.queryParameters["page"]!),
            fromPresent: bool.fromEnvironment(
                uri.queryParameters["fromPresent"]!,
                defaultValue: false));
      };
    }
    if (responseMap["previous"] != null) {
      var uri = Uri.parse(responseMap["previous"]);

      responseMap["previous"] = () {
        all(
            page: int.parse(uri.queryParameters["page"]!),
            fromPresent: bool.fromEnvironment(
                uri.queryParameters["fromPresent"]!,
                defaultValue: false));
      };
    }
    List<Assignment> assignmentList = [];
    for (var item in responseMap["results"]) {
      assignmentList.add(Assignment.fromJson(item));
    }
    return BulkApiResponse(responseMap["next"], responseMap["previous"],
        assignmentList.length, assignmentList);
  }

  /// Update the Assignment Object with [id] in the GarnBarnApi
  Future<Assignment> update(Assignment assignment) async {
    Map<String, dynamic> assignmentJson = assignment.toJson();
    assignmentJson.remove("id");
    ApiV1Response response = await sendRequest(
        ApiMethods.PATCH, "$_apiBaseUrl/${assignment.id}/",
        body: assignmentJson);
    var responseMap = response.getMapBody();
    return Assignment.fromJson(responseMap);
  }
}
