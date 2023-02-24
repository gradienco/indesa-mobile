import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class ListTileHistory extends StatelessWidget {
  String desa, kategori, poinIDM;
  Function onTap;
  ListTileHistory(
      {@required this.poinIDM,
      @required this.kategori,
      @required this.desa,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desa,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: cDarkGreen,
                          fontSize: setFontSize(45),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          poinIDM,
                          style: TextStyle(
                            fontSize: setFontSize(40),
                            color: cDarkGreen,
                          ),
                        ),
                        Text(
                          kategori,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: setFontSize(43),
                              color: cDarkGreen,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Divider(),
            )
          ],
        ),
      ),
    );
  }
}
