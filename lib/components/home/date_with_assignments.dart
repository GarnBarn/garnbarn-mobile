import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/components/home/assignment_box.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/types/assignment.dart';

class DateWithAssignment extends StatelessWidget {
  final String date;
  final List<Assignment> assignments;
  const DateWithAssignment(
      {Key? key, required this.date, required this.assignments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            date,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: assignments.length,
            itemBuilder: (assignmentBuildContext, i) {
              return AssignmentBox(
                assignment: assignments[i],
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ],
      ),
    );
  }
}
