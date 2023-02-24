import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class CardButton extends StatelessWidget {
  double deviceWidth, deviceHeight;
  String assetImage, title;
  Function onTap;

  CardButton({
    @required this.deviceWidth,
    @required this.deviceHeight,
    @required this.assetImage,
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      margin:
          EdgeInsets.only(left: deviceWidth * 0.06, right: deviceWidth * 0.06),
      decoration: BoxDecoration(
        color: cLightGrey,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 2,
            offset: Offset(0.5, 4),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 13),
                  child: Image(
                    width: 80,
                    height: 80,
                    image: AssetImage(assetImage),
                  )),
              Padding(
                padding: EdgeInsets.all(12),
              ),
              Flexible(
                  child: Text(title,
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: setFontSize(48)
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
