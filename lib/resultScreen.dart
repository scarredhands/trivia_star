import 'package:flutter/material.dart';
import 'package:trivia_star/homePage.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: 521,
              width: 400,
              child: Stack(children: [
                Container(
                  height: 340,
                  width: 410,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular((20)),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: Colors.white.withOpacity(0.4),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Here Is Your Score',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: '100',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      children: [
                                    TextSpan(
                                        text: 'point',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black))
                                  ]))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 22,
                  child: Container(
                      height: 190,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.cyan.withOpacity(0.7),
                                offset: Offset(0, 1))
                          ]),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.cyan),
                                                  ),
                                                  const Text(
                                                    '100%',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 20,
                                                        color: Colors.cyan),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Text(
                                              'correct',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            decoration:
                                                                BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .cyan),
                                                          ),
                                                          const Text(
                                                            '100%',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .cyan),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      'wrong',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ]),
                                ]),
                          ))),
                ),
              ])),
          SizedBox(
            height: 40,
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.cyan,
                        radius: 35,
                        child: Icon(
                          Icons.refresh,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homePage()));
                      },
                    ),
                    SizedBox(
                      child: Text(
                        'play again',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 35,
                      child: Icon(
                        Icons.visibility,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        'review answer',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 35,
                      child: Icon(
                        Icons.share,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        'share score',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
