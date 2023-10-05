import 'dart:math';

import 'package:flutter/material.dart';

class fivepuzzle extends StatefulWidget {
  const fivepuzzle({Key? key}) : super(key: key);

  @override
  State<fivepuzzle> createState() => _fivepuzzleState();
}

class _fivepuzzleState extends State<fivepuzzle> {
  List ll = [];
  String msg = "";
  int cnt=0;

  @override
  void initState() {
    super.initState();
    setState(() {
      restart();
    });
  }

  void restart() {
    setState(() {
      ll = List.filled(26, "");
      for (int i = 0; i < 26; i++) {
        while (true) {
          int r = Random().nextInt(26);
          if (!ll.contains("$r")) {
            ll[i] = r.toString();
            break;
          }
        }
      }
      for (int i = 0; i < 26; i++) {
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
      }
    });
  }

  shift1(int i) {
    setState(() {
      if (ll[i - 1] == "") {
        ll[i - 1] = ll[i];
        ll[i] = "";
      }
    });
  }

  shift2(int i) {
    setState(() {
      if (ll[i - 5] == "") {
        ll[i - 5] = ll[i];
        ll[i] = "";
      }
    });
  }

  shift3(int i) {
    setState(() {
      if (ll[i + 5] == "") {
        ll[i + 5] = ll[i];
        ll[i] = "";
      }
    });
  }

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
          ll[15] == "16" &&
          ll[16] == "17" &&
          ll[17] == "18" &&
          ll[18] == "19" &&
          ll[19] == "20" &&
          ll[20] == "21" &&
          ll[21] == "22" &&
          ll[22] == "23" &&
          ll[23] == "24" &&
          ll[24] == "25" &&
          ll[25] == "") {
        msg = "You Win The Game!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              "msg",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            // decoration: BoxDecoration(
            //     // color: Colors.black,
            //     borderRadius: BorderRadius.all(Radius.circular(10)))
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
                          winner(0);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[0],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[0] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[0] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
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
                          winner(1);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[1],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[1] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[1] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
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
                          winner(2);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[2],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[2] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[2] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(3);
                          shift1(3);
                          shift3(3);
                          winner(3);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[3],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[3] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[3] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift1(4);
                          shift3(4);
                          winner(4);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[4],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[4] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[4] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
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
                          shift(5);
                          shift2(5);
                          shift3(5);
                          winner(5);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[5],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[5] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[5] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
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
                        padding: EdgeInsets.all(10),
                        child: Text(ll[6],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[6] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[6] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(7);
                          shift1(7);
                          shift2(7);
                          shift3(7);
                          winner(7);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[7],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[7] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[7] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(8);
                          shift1(8);
                          shift2(8);
                          shift3(8);
                          winner(8);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[8],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[8] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[8] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift1(9);
                          shift2(9);
                          shift3(9);
                          winner(9);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[9],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[9] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[9] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
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
                          shift(10);
                          shift2(10);
                          shift3(10);
                          winner(10);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[10],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[10] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[10] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(11);
                          shift1(11);
                          shift2(11);
                          shift3(11);
                          winner(11);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[11],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[11] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[11] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(12);
                          shift1(12);
                          shift2(12);
                          shift3(12);
                          winner(12);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[12],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[12] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[12] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
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
                          shift3(13);
                          winner(13);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[13],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[13] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[13] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift1(14);
                          shift2(14);
                          shift3(14);
                          winner(14);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[14],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[14] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[14] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
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
                          shift(15);
                          shift2(15);
                          shift3(15);
                          winner(15);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[15],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[15] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[15] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(16);
                          shift1(16);
                          shift2(16);
                          shift3(16);
                          winner(16);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[16],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[16] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[16] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(17);
                          shift1(17);
                          shift2(17);
                          shift3(17);
                          winner(17);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[17],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[17] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[17] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(18);
                          shift1(18);
                          shift2(18);
                          shift3(18);
                          winner(18);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[18],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[18] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[18] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift1(19);
                          shift2(19);
                          shift2(19);
                          winner(19);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[19],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[19] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[19] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
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
                          shift(20);
                          shift2(20);
                          winner(20);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[20],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[20] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[20] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(21);
                          shift1(21);
                          shift2(21);
                          winner(21);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[21],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[21] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[21] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(22);
                          shift1(22);
                          shift2(22);
                          winner(22);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[22],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[22] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[22] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(23);
                          shift1(23);
                          shift2(23);
                          winner(23);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[23],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[23] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[23] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift1(24);
                          shift2(24);
                          winner(24);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[24],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 62,
                                color: (ll[24] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[24] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 1),
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
          Expanded(flex: 2,
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
    );
  }
}
