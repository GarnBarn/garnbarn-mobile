import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/assignment.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/tag.dart';
import 'package:test/test.dart';

void main() {
  test("Test Assignment Object JSON Serialization", () {
    Map<String, dynamic> tagObjectJson = {
      "id": 1,
      "name": "ISP",
      "author": "0000000000000000000000000000",
      "color": "#4285F4"
    };
    Map<String, dynamic> assignmentObjectJson = {
      "id": 1,
      "name": "Example Assignment",
      "author": "0000000000000000000000000000",
      "description": "This is example",
      "dueDate": 1634745493,
      "tag": tagObjectJson,
      "reminderTime": [1, 2, 3]
    };
    Assignment assignment = Assignment.fromJson(assignmentObjectJson);
    Tag tag = Tag.fromJson(tagObjectJson);
    expect(assignment.id, assignmentObjectJson["id"]);
    expect(assignment.name, assignmentObjectJson["name"]);
    expect(assignment.author, assignmentObjectJson["author"]);
    expect(assignment.description, assignmentObjectJson["description"]);
    expect(assignment.dueDate,
        DateTime.fromMillisecondsSinceEpoch(assignmentObjectJson["dueDate"]));
    expect(assignment.reminderTime, assignmentObjectJson["reminderTime"]);
    expect(assignment.tag, tag);
  });
}
