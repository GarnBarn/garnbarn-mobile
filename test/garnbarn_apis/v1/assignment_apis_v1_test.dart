import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/assignment_apis_v1.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/assignment.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'assignment_apis_v1_test.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

const assignmentBody = {
  "id": 1,
  "name": "Example Assignment",
  "author": "0000000000000000000000000000",
  "dueDate": 1634745493,
  "tag": {
    "id": 1,
    "author": "0000000000000000000000000000",
    "name": "ISP",
    "color": "#4285F4"
  },
  "reminderTime": [1, 2, 3]
};

@GenerateMocks([User, http.Client])
void main() {
  group("Test Assignment APIs v1", () {
    AssignmentApisV1? assignmentApisV1;
    MockUser firebaseUser = MockUser();
    MockClient client = MockClient();

    setUpAll(() {
      reset(firebaseUser);
      reset(client);
      when(firebaseUser.getIdToken())
          .thenAnswer((_) async => "EXAMPLE_ID_TOKEN");
      assignmentApisV1 = AssignmentApisV1(firebaseUser, httpClient: client);
    });
    test("Test Get Assignment APIs", () async {
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
          (_) async => http.Response(jsonEncode(assignmentBody), 200));
      Assignment assignment = await assignmentApisV1!.get(1);
      Assignment expectedAssignment = Assignment.fromJson(assignmentBody);
      verify(firebaseUser.getIdToken());
      verify(client.get(any, headers: anyNamed("headers")));
      expect(assignment, expectedAssignment);
    });
  });
}
