import 'package:firebase_auth/firebase_auth.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/apis_v1.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/api_methods.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/assignment.dart';

class AssignmentApisV1 extends ApisV1 {
  final String _apiBaseUrl = "/api/v1/assignment";
  AssignmentApisV1(User firebaseUser) : super(firebaseUser);

  /// Get the Assignment object with [id] from the GarnBarnApi
  Future<Assignment> get(int id) async {
    ApiV1Response response = await sendRequest(ApiMethods.GET, _apiBaseUrl);
    response.verifySuccess();
    Map<String, String> responseMap = response.getMapBody();
    return Assignment.fromJson(responseMap);
  }
}
