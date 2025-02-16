import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

bool one = false;
bool two = false;
bool three = false;
var colour = Colors.white;
bool stackValue = false;

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Row(spacing: 15, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 23,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    stackValue = false;
                  });
                },
                onLongPress: () {
                  setState(() {
                    stackValue = true;
                  });
                },
                child: stackValue == false
                    ? Container(
                        height: 100,
                        width: 100,
                        color: one ? Colors.green : Colors.orange,
                      )
                    : Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: one ? Colors.green : Colors.orange,
                          ),
                          Checkbox(
                              value: one,
                              onChanged: (bl) {
                                setState(() {
                                  one = bl!;
                                });
                              })
                        ],
                      ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    stackValue = false;
                  });
                },
                onLongPress: () {
                  setState(() {
                    stackValue = true;
                  });
                },
                child: stackValue == false
                    ? Container(
                        height: 100,
                        width: 100,
                        color: two ? Colors.blue : Colors.white,
                      )
                    : Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: two ? Colors.blue : Colors.white,
                          ),
                          Checkbox(
                              value: two,
                              onChanged: (bl) {
                                setState(() {
                                  two = bl!;
                                });
                              })
                        ],
                      ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    stackValue = false;
                  });
                },
                onLongPress: () {
                  setState(() {
                    stackValue = true;
                  });
                },
                child: stackValue == false
                    ? Container(
                        height: 100,
                        width: 100,
                        color: three ? Colors.orange : Colors.green)
                    : Stack(
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              color: three ? Colors.orange : Colors.green),
                          Checkbox(
                              value: three,
                              onChanged: (bl) {
                                setState(() {
                                  three = bl!;
                                });
                              })
                        ],
                      ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Column(
              children: [
                Container(
                  color: colour,
                  height: 200,
                  width: 200,
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          colour = Colors.red;
                        });
                      },
                      child: Text("red"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          colour = Colors.green;
                        });
                      },
                      child: Text("green"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          colour = Colors.yellow;
                        });
                      },
                      child: Text("yellow"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          colour = Colors.blue;
                        });
                      },
                      child: Text("blue"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
