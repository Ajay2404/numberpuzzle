import 'dart:math';

import 'package:flutter/material.dart';

class fourpuzzle extends StatefulWidget {
  const fourpuzzle({Key? key}) : super(key: key);

  @override
  State<fourpuzzle> createState() => _fourpuzzleState();
}

class _fourpuzzleState extends State<fourpuzzle> {
  List ll = [];
  String msg = "msg";
  int cnt = 0;

  @override
  void initState() {
    super.initState();
      restart();
  }

  void restart() {
    setState(() {
      ll = List.filled(16, "");
      for (int i = 0; i < 16; i++) {
        while (true) {
          int r = Random().nextInt(16);
          if (!ll.contains("$r")) {
            ll[i] = r.toString();
            break;
          }
        }
      }
      for (int i = 0; i < 16; i++) {
        if (ll[i] == "0") {
          ll[i] = "";
          break;
        }
      }
    });
  }

  shift(int i) {
    setState(() {
      if (ll[i + 1] == "") {
        ll[i + 1] = ll[i];
        ll[i] = "";
        cnt++;
      }
    });
  }

  shift1(int i) {
    setState(() {
      if (ll[i - 1] == "") {
        ll[i - 1] = ll[i];
        ll[i] = "";
        cnt++;
      }
    });
  }

  shift2(int i) {
    setState(() {
      if (ll[i - 4] == "") {
        ll[i - 4] = ll[i];
        ll[i] = "";
        cnt++;
      }
    });
  }

  shift3(int i) {
    setState(() {
      if (ll[i + 4] == "") {
        ll[i + 4] = ll[i];
        ll[i] = "";
        cnt++;
      }
    });
  }

  slide(int i) {
    if (ll[3] == "") {
      ll[3] = ll[2];
      ll[2] = ll[1];
      ll[1] = ll[0];
      ll[0] = "";
      cnt++;
    } else if (ll[7] == "") {
      ll[7] = ll[6];
      ll[6] = ll[5];
      ll[5] = ll[4];
      ll[4] = "";
      cnt++;
    } else if (ll[11] == "") {
      ll[11] = ll[10];
      ll[10] = ll[9];
      ll[9] = ll[8];
      ll[8] = "";
      cnt++;
    } else if (ll[15] == "") {
      ll[15] = ll[14];
      ll[14] = ll[13];
      ll[13] = ll[12];
      ll[12] = "";
      cnt++;
    }
  } //right

  slide1(int i) {
    if (ll[0] == "") {
      ll[0] = ll[1];
      ll[1] = ll[2];
      ll[2] = ll[3];
      ll[3] = "";
      cnt++;
    } else if (ll[4] == "") {
      ll[4] = ll[5];
      ll[5] = ll[6];
      ll[6] = ll[7];
      ll[7] = "";
      cnt++;
    } else if (ll[8] == "") {
      ll[8] = ll[9];
      ll[9] = ll[10];
      ll[10] = ll[11];
      ll[11] = "";
      cnt++;
    } else if (ll[12] == "") {
      ll[12] = ll[13];
      ll[13] = ll[14];
      ll[14] = ll[15];
      ll[15] = "";
      cnt++;
    }
  } //left

  slide2(int i) {
    if (ll[12] == "") {
      ll[12] = ll[8];
      ll[8] = ll[4];
      ll[4] = ll[0];
      ll[0] = "";
      cnt++;
    } else if (ll[13] == "") {
      ll[13] = ll[9];
      ll[9] = ll[5];
      ll[5] = ll[1];
      ll[1] = "";
      cnt++;
    } else if (ll[14] == "") {
      ll[14] = ll[10];
      ll[10] = ll[6];
      ll[6] = ll[2];
      ll[2] = "";
      cnt++;
    } else if (ll[15] == "") {
      ll[15] = ll[11];
      ll[11] = ll[7];
      ll[7] = ll[3];
      ll[3] = "";
      cnt++;
    }
  } //down

  slide3(int i) {
    if (ll[0] == "") {
      ll[0] = ll[4];
      ll[4] = ll[8];
      ll[8] = ll[12];
      ll[12] = "";
      cnt++;
    } else if (ll[1] == "") {
      ll[1] = ll[5];
      ll[5] = ll[9];
      ll[9] = ll[13];
      ll[13] = "";
      cnt++;
    } else if (ll[2] == "") {
      ll[2] = ll[6];
      ll[6] = ll[10];
      ll[10] = ll[14];
      ll[14] = "";
      cnt++;
    } else if (ll[3] == "") {
      ll[3] = ll[7];
      ll[7] = ll[11];
      ll[11] = ll[15];
      ll[15] = "";
      cnt++;
    }
  } //up

  void winner(int i) {
    setState(() {
      if (ll[0] == "1" &&
          ll[1] == "2" &&
          ll[2] == "3" &&
          ll[3] == "4" &&
          ll[4] == "5" &&
          ll[5] == "6" &&
          ll[6] == "7" &&
          ll[7] == "8" &&
          ll[8] == "9" &&
          ll[9] == "10" &&
          ll[10] == "11" &&
          ll[11] == "12" &&
          ll[12] == "13" &&
          ll[13] == "14" &&
          ll[14] == "15" &&
          ll[15] == "") {
        msg = "You Win The Game!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Container(padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Text(
                    "msg",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                )),
            Expanded(
              child: Container(
                color: Colors.black,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(0);
                            shift3(0);
                            slide(0);
                            slide2(0);
                            winner(0);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[0],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[0] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[0] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(1);
                            shift1(1);
                            shift3(1);
                            slide2(1);
                            winner(1);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[1] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[1] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(2);
                            shift1(2);
                            shift3(2);
                            slide2(2);
                            winner(2);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[2],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[2] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[2] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift1(3);
                            shift3(3);
                            slide1(3);
                            slide2(3);
                            winner(3);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[3],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[3] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[3] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(4);
                            shift2(4);
                            shift3(4);
                            slide(4);
                            winner(4);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[4],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[4] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[4] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(5);
                            shift1(5);
                            shift2(5);
                            shift3(5);
                            winner(5);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[5],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[5] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[5] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(6);
                            shift1(6);
                            shift2(6);
                            shift3(6);
                            winner(6);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[6],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[6] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[6] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift1(7);
                            shift2(7);
                            shift3(7);
                            slide1(7);
                            winner(7);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[7],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[7] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[7] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(8);
                            shift2(8);
                            shift3(8);
                            slide(8);
                            winner(8);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[8],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[8] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[8] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(9);
                            shift1(9);
                            shift2(9);
                            shift3(9);
                            winner(9);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[9],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[9] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[9] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(10);
                            shift1(10);
                            shift2(10);
                            shift3(10);
                            winner(10);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[10],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[10] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[10] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift1(11);
                            shift2(11);
                            shift3(11);
                            slide1(11);
                            winner(11);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[11],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[11] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[11] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(12);
                            shift2(12);
                            slide(12);
                            slide3(12);
                            winner(12);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[12],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[12] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[12] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(13);
                            shift1(13);
                            shift2(13);
                            slide3(13);
                            winner(13);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[13],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[13] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[13] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift(14);
                            shift1(14);
                            shift2(14);
                            slide3(14);
                            winner(14);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[14],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[14] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[14] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shift1(15);
                            shift2(15);
                            slide1(15);
                            winner(15);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(ll[15],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (ll[15] == "")
                                      ? Colors.white
                                      : Colors.brown)),
                          margin: EdgeInsets.all(01),
                          decoration: BoxDecoration(
                            color: (ll[15] == "") ? Colors.brown : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  msg = "";
                  restart();
                  cnt = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Container(padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Text(
                  "New Game",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: Container(padding: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MOVES:",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(cnt.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
