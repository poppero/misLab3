import 'package:flutter/material.dart';

import '../model/exam.dart';
import '../constants/colors.dart';
import '../widgets/exam_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final examsList = ExAm.examList();
  List<ExAm> _foundExam = [];
  final _examController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void initState() {
    _foundExam = examsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Text(
                  'All inputs have to be filled! EX: EXAM : "TEXT" , DATE FORMAT :  YYYY-MM-DD HH:MM:SS ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        'Exams',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    for (ExAm exaam in _foundExam.reversed)
                      ExamItem(exam: exaam),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _examController,
                  decoration: InputDecoration(
                    hintText: 'Add new exam',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: 'Add date',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    if (_examController.text.isNotEmpty &&
                        _dateController.text.isNotEmpty) {
                      _addExAmItem(
                        _examController.text,
                        _dateController.text,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(double.infinity, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addExAmItem(String exam, String date) {
    setState(() {
      examsList.add(ExAm(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          examText: exam,
          date: date));
    });
    _examController.clear();
    _dateController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ExAm> results = [];
    if (enteredKeyword.isEmpty) {
      results = examsList;
    } else {
      results = examsList
          .where((item) => item.examText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundExam = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: 40,
          width: 40,
        ),
      ]),
    );
  }
}
