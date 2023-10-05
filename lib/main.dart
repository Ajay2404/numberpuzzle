import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpuzzle/page.dart';
import 'package:numberpuzzle/page1.dart';

void main() {
  runApp(MaterialApp(
    home: selectscreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class selectscreen extends StatefulWidget {
  const selectscreen({Key? key}) : super(key: key);

  @override
  State<selectscreen> createState() => _selectscreenState();
}

class _selectscreenState extends State<selectscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text("Number Puzzle", style: TextStyle(fontSize: 30)),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return puzzle();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, minimumSize: Size(160, 40)),
              child: Text("3X3",
                  style: TextStyle(fontSize: 30, color: Colors.black))),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return fourpuzzle();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, minimumSize: Size(160, 40)),
              child: Text("4X4",
                  style: TextStyle(fontSize: 30, color: Colors.black))),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return fivepuzzle();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, minimumSize: Size(160, 40)),
              child: Text("5X5",
                  style: TextStyle(fontSize: 30, color: Colors.black))),
        ],
      ),
    );
  }
}

class puzzle extends StatefulWidget {
  const puzzle({Key? key}) : super(key: key);

  @override
  State<puzzle> createState() => _puzzleState();
}

class _puzzleState extends State<puzzle> {
  List ll = [];
  String msg = "";
  int cnt = 0;

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
      if (ll[i - 3] == "") {
        ll[i - 3] = ll[i];
        ll[i] = "";
        cnt++;
      }
    });
  }

  shift3(int i) {
    setState(() {
      if (ll[i + 3] == "") {
        ll[i + 3] = ll[i];
        ll[i] = "";
        cnt++;
      }
    });
  }

  slide(int i) {
    if (ll[2] == "") {
      ll[2] = ll[1];
      ll[1] = ll[0];
      ll[0] = "";
      cnt++;
    } else if (ll[5] == "") {
      ll[5] = ll[4];
      ll[4] = ll[3];
      ll[3] = "";
      cnt++;
    } else if (ll[8] == "") {
      ll[8] = ll[7];
      ll[7] = ll[6];
      ll[6] = "";
      cnt++;
    }
  } //right

  slide1(int i) {
    if (ll[0] == "") {
      ll[0] = ll[1];
      ll[1] = ll[2];
      ll[2] = "";
      cnt++;
    } else if (ll[3] == "") {
      ll[3] = ll[4];
      ll[4] = ll[5];
      ll[5] = "";
      cnt++;
    } else if (ll[6] == "") {
      ll[6] = ll[7];
      ll[7] = ll[8];
      ll[8] = "";
      cnt++;
    }
  } //left

  slide2(int i) {
    if (ll[6] == "") {
      ll[6] = ll[3];
      ll[3] = ll[0];
      ll[0] = "";
      cnt++;
    } else if (ll[7] == "") {
      ll[7] = ll[4];
      ll[4] = ll[1];
      ll[1] = "";
      cnt++;
    } else if (ll[8] == "") {
      ll[8] = ll[5];
      ll[5] = ll[2];
      ll[2] = "";
      cnt++;
    }
  } //down

  slide3(int i) {
    if (ll[0] == "") {
      ll[0] = ll[3];
      ll[3] = ll[6];
      ll[6] = "";
      cnt++;
    } else if (ll[1] == "") {
      ll[1] = ll[4];
      ll[4] = ll[7];
      ll[7] = "";
      cnt++;
    } else if (ll[2] == "") {
      ll[2] = ll[5];
      ll[5] = ll[8];
      ll[8] = "";
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
          ll[8] == "") {
        msg = "You Win The Game!";
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    restart();
  }

  void restart() {
    setState(() {
      ll = List.filled(9, "");
      for (int i = 0; i < 9; i++) {
        while (true) {
          int r = Random().nextInt(9);
          if (!ll.contains("$r")) {
            ll[i] = r.toString();
            break;
          }
        }
      }
      for (int i = 0; i < 9; i++) {
        if (ll[i] == "0") {
          ll[i] = "";
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFA603232),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
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
                        padding: EdgeInsets.all(10),
                        child: Text(ll[0],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[0] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[0] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
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
                        padding: EdgeInsets.all(10),
                        child: Text(ll[1],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[1] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[1] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift1(2);
                          shift3(2);
                          slide1(2);
                          slide2(2);
                          winner(2);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[2],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[2] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[2] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
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
                          shift(3);
                          shift2(3);
                          shift3(3);
                          slide(3);
                          winner(3);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[3],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[3] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[3] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift(4);
                          shift1(4);
                          shift2(4);
                          shift3(4);
                          winner(4);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[4],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[4] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[4] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift1(5);
                          shift2(5);
                          shift3(5);
                          slide1(5);
                          winner(5);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[5],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[5] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[5] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
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
                          shift(6);
                          shift2(6);
                          slide(6);
                          slide3(6);
                          winner(6);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[6],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[6] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[6] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
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
                          slide3(7);
                          winner(7);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[7],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[7] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[7] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shift1(8);
                          shift2(8);
                          slide1(8);
                          slide3(8);
                          winner(8);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(ll[8],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 120,
                                color: (ll[8] == "")
                                    ? Colors.white
                                    : Colors.brown)),
                        margin: EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: (ll[8] == "") ? Colors.brown : Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
            child: Text(
              "New Game",
              style: TextStyle(fontSize: 30, color: Colors.black,),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(50),
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
