import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {

  final double width, progress;
  ProgressBar({
    @required this.width,
    @required this.progress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: 10,
          decoration: BoxDecoration(
              color: Color(0xFF457D66),
            borderRadius: BorderRadius.circular(5)
          ),
        ),

        Material(
          borderRadius: BorderRadius.circular(5),
          child: AnimatedContainer(
            width: width * progress,
            height: 10,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(5)
            ),
          ),
        )
      ],
    );
  }
}

