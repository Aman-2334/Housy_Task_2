import 'package:flutter/material.dart';

class DragObject {
  Widget item(String data, bool circle) {
    return Draggable<String>(
      data: data,
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              circle ? Radius.circular(100) : Radius.circular(30)),
          color: circle ? Colors.white : Color(0xFFFFDEDE),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              circle
                  ? 'Dragable and Dropable circle'
                  : 'Dragable and Dropable squircle',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      feedback: Material(
        type: MaterialType.transparency,
        child: Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                circle ? Radius.circular(100) : Radius.circular(30)),
            color: circle ? Colors.white : Color(0xFFFFDEDE),
          ),
          child: Center(
            child: Text(
               circle
                  ? 'Dragable and Dropable circle'
                  : 'Dragable and Dropable squircle',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      childWhenDragging: Container(
        width: 130,
        height: 130,
      ),
    );
  }
}
