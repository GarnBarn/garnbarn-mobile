import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/tag.dart';
import 'package:test/test.dart';

void main() {
  test("Test Tag Object JSON Serialization", () {
    final Map<String, dynamic> tagJson = {
      "id": 1,
      "name": "ISP",
      "author": "0000000000000000000000000000",
      "color": "#4285F4"
    };
    Tag tag = Tag.fromJson(tagJson);
    expect(tag.id, tagJson["id"]);
    expect(tag.name, tagJson["name"]);
    expect(tag.author, tagJson["author"]);
    expect(tag.color, const Color.fromRGBO(66, 133, 244, 1));
  });
}
