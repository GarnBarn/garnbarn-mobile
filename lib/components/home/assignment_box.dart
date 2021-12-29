import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/types/assignment.dart';

class AssignmentBox extends StatelessWidget {
  final Assignment assignment;
  const AssignmentBox({Key? key, required this.assignment}) : super(key: key);

  Color getTextColor(Color backgroundColor) {
    int r = backgroundColor.red;
    int g = backgroundColor.green;
    int b = backgroundColor.blue;
    if (r * 0.299 + g * 0.587 + b * 0.114 > 186) {
      return Colors.black;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: assignment.getColor(),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Assignment Name
              Expanded(
                flex: 2,
                child: Text(
                  assignment.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: getTextColor(
                      assignment.getColor(),
                    ),
                  ),
                ),
              ),
              // Tag Box
              // TODO: Implement Tag Box
              Expanded(
                flex: 1,
                child: Text(
                  "ISP",
                  style: TextStyle(
                    color: getTextColor(
                      assignment.getColor(),
                    ),
                  ),
                ),
              ),
              // Submission Time
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time_filled,
                      color: getTextColor(
                        assignment.getColor(),
                      ),
                    ),
                    Text(
                      "Submisson Time: " + assignment.dueDate.toString(),
                      style: TextStyle(
                        color: getTextColor(
                          assignment.getColor(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
