import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/exam.dart';
import '../constants/colors.dart';

class ExamItem extends StatelessWidget {
  final ExAm exam;

  const ExamItem({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final examDate = DateTime.parse(exam.date!);
    final formattedDate = DateFormat('MMM dd, yyyy hh:mm a').format(examDate);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        title: Text(
          exam.examText!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: tdBlack,
          ),
        ),
        subtitle: Text(
          formattedDate,
          style: TextStyle(
            fontSize: 12,
            color: tdGrey,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}
