import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/components/home/date_with_assignments.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/assignment.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/tag.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/logo/garnbarn_horizontal_logo.png",
                fit: BoxFit.scaleDown,
                width: 150,
                height: 100,
              )
            ],
          ),
        ),
        body: Scrollbar(
          radius: const Radius.circular(20),
          thickness: 7,
          interactive: true,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DateWithAssignment(
                  date: "12 Dec 2025",
                  assignments: <Assignment>[
                    Assignment(
                      id: 123,
                      name:
                          "Example1234dafsdefdf123ddfas3erasefasdfa34rasdfasdfasdfaasdfaefaefasefasdfasdefasfcaefasd",
                      author: "1234",
                      tag: Tag(
                        id: 1,
                        name:
                            "Example1234dafsdefdf123ddfas3erasefasdfa34rasdfasdfasdfaasdfaefaefasefasdfasdefasfcaefasd",
                        author: "123",
                        color: const Color.fromRGBO(100, 0, 0, 1),
                      ),
                    ),
                    Assignment(
                      id: 123,
                      name: "Example",
                      author: "1234",
                      dueDate: DateTime.now(),
                      tag: Tag(
                        id: 1,
                        name:
                            "Example1234dafsdefdf123ddfas3erasefasdfa34rasdfasdfasdfaasdfaefaefasefasdfasdefasfcaefasd",
                        author: "123",
                        color: const Color.fromRGBO(100, 100, 0, 1),
                      ),
                    ),
                    Assignment(
                      id: 123,
                      name: "Example",
                      author: "1234",
                      tag: Tag(
                        id: 1,
                        name:
                            "Example1234dafsdefdf123ddfas3erasefasdfa34rasdfasdfasdfaasdfaefaefasefasdfasdefasfcaefasd",
                        author: "123",
                        color: const Color.fromRGBO(247, 233, 195, 1),
                      ),
                    ),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                  ],
                ),
                DateWithAssignment(
                  date: "13 Dec 2025",
                  assignments: <Assignment>[
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234")
                  ],
                ),
                DateWithAssignment(
                  date: "14 Dec 2025",
                  assignments: <Assignment>[
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234"),
                    Assignment(id: 123, name: "Example", author: "1234")
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
