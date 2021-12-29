import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/types/assignment.dart';

class AssignmentBox extends StatelessWidget {
  final Assignment assignment;
  const AssignmentBox({Key? key, required this.assignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: assignment.getColor(),
        child: Center(
          child: Text(assignment.name),
        ),
      ),
    );
  }
}
