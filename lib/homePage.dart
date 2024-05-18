import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_star/options.dart';

import 'resultScreen.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List responseData = [];
  int? selectedOption;
  int number = 0;
  late Timer _timer;
  int _seconRemaining = 10;
  List<String> shuffledOptions = [];
  int correctAnswerIndex = 0;
  Future api() async {
    final response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      setState(() {
        responseData = data;
        updateShuffleOption();
      });
    }
  }

  void selectOption(int index) {
    setState(() {
      selectedOption = index;
      bool isCorrect = index == responseData[number]['correct_answer'];
    });
    return responseData[number]['correct_answer'];
  }

  @override
  void initState() {
    super.initState();
    api();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 421,
              width: 400,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 240,
                      width: 390,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: Colors.white,
                            )
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '05',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 20),
                                ),
                                Text(
                                  '07',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                )
                              ],
                            ),
                            Center(
                              child: Text(
                                "Question ${number + 1}/10",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(responseData.isNotEmpty
                                ? responseData[number]['question']
                                : ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 210,
                      left: 140,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Text(_seconRemaining.toString(),
                              style:
                                  TextStyle(color: Colors.cyan, fontSize: 25)),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Column(
              children: (responseData.isNotEmpty &&
                      responseData[number]['incorrect_answers'] != null)
                  ? shuffledOptions.map((option) {
                      return options(option: option.toString());
                    }).toList()
                  : [],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular((10))),
                  elevation: 5,
                ),
                onPressed: () {
                  nextQuestion();
                },
                child: Container(
                    alignment: Alignment.center,
                    child: Text('Next',
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ),
            )
          ],
        ),
      ),
    );
  }

  void completed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => resultScreen()));
  }

  void nextQuestion() {
    if (number == 9) {
      completed();
    }
    setState(() {
      number = number + 1;
      updateShuffleOption();
      _seconRemaining = 10;
    });
  }

  List<String> shuffleOption(List<String> option) {
    List<String> shuffledOptions = List.from(option);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  void updateShuffleOption() {
    setState(() {
      shuffledOptions = shuffleOption([
        responseData[number]['correct_answer'],
        ...(responseData[number]['incorrect_answers'] as List)
      ]);
    });
    correctAnswerIndex =
        shuffledOptions.indexOf(responseData[number]['correct_answer']);
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        if (_seconRemaining > 0) {
          _seconRemaining--;
        } else {
          nextQuestion();
          _seconRemaining = 10;
          updateShuffleOption();
        }
      });
    });
  }

  void correctAnswer() {
    String correctAnswer = responseData[number]['correct_answer'];
  }
}
