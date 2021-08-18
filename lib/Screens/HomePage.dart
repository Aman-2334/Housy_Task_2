import 'package:flutter/material.dart';
import 'package:houst_task2/widgets/DragObject.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool accepted = false;
  String selected = '';
  String footer = 'None Selected';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF88E1F2), Color(0xFFF56A79)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selected == 'circle'
                    ? Container(width: 130, height: 130)
                    : DragObject().item('Circle Selected', true),
                selected == 'squircle'
                    ? Container(width: 130, height: 130)
                    : DragObject().item('Squircle Selected', false),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white54),
              child: Center(
                child: SizedBox(
                  width: 130,
                  height: 130,
                  child: DragTarget(
                    builder: (context, acceptedData, rejectedData) {
                      return accepted
                          ? selected == 'circle'
                              ? DragObject().item('Circle Selected', true)
                              : DragObject().item('Squircle Selected', false)
                          : Center(
                              child: Text(
                                'DROP TARGET',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            );
                    },
                    onAccept: (String data) {
                      setState(() {
                        accepted = true;
                        data == 'Circle Selected'
                            ? selected = 'circle'
                            : selected = 'squircle';
                        footer = data;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              footer,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
