import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/components/home/tag_box.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/types/assignment.dart';

class AssignmentBox extends StatelessWidget {
  final Assignment assignment;
  // Config for Card BorderRadius and Ripple Effect Radius.
  static final BorderRadius _cardBorderRadius = BorderRadius.circular(20);
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
          borderRadius: _cardBorderRadius,
        ),
        color: assignment.getColor(),
        child: InkWell(
          borderRadius: _cardBorderRadius,
          onTap: () {
            // TODO: Implement onTap Event Here
            print("Hello");
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Assignment Name
                Text(
                  assignment.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 25,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: getTextColor(
                      assignment.getColor(),
                    ),
                  ),
                ),
                // Tag Box
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: assignment.tag != null
                      ? TagBox(
                          tag: assignment.tag!,
                        )
                      : Container(),
                ),
                // Submission Time
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Icon(
                            Icons.access_time_filled,
                            color: getTextColor(
                              assignment.getColor(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              assignment.dueDate == null
                                  ? "-"
                                  : "${assignment.dueDate!.hour.toString()}:${assignment.dueDate!.minute.toString()}",
                              style: TextStyle(
                                fontSize: 17,
                                color: getTextColor(
                                  assignment.getColor(),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              softWrap: false,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
