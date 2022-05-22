import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/tag.dart';

class TagBox extends StatelessWidget {
  final Tag tag;
  const TagBox({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromRGBO(0, 0, 0, .3),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          tag.name,
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, .7),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
