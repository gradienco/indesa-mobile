import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class NextPrevButton extends StatelessWidget {

  Function onTap;
  IconData icon;
  NextPrevButton({
    @required this.onTap,
    @required this.icon
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: cDarkGreen,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: Offset(-2,3)
              ),
            ]
        ),
        child: Icon(icon,
          color: Colors.white,),
      ),
    );
  }
}
