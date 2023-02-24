import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class CardIndex extends StatelessWidget {
  String category, desa, logoCategory;
  int score;
  CardIndex({
    @required this.category,
    @required this.desa,
    @required this.score,
    @required this.logoCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3),
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Image.asset("assets/images/category/$logoCategory.png",
                  width: 150,
                  height: 150,),
              ),
            ),

            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    desa,
                    style: TextStyle(
                      color: cDarkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: setFontSize(70)
                    ),
                  ),

                  Text(
                    "Indeks Desa",
                    style: TextStyle(
                        color: Colors.grey,
                      fontSize: setFontSize(40)
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFE4E4E4),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Text(
                        "$score",
                        style: TextStyle(
                            color: cDarkGreen,
                            fontSize: setFontSize(35),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),

                  Text(
                    category,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                      fontSize: setFontSize(45)
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5),
            ),
          ],
        ),
      ),
    );
  }
}
