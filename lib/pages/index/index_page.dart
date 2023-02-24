import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/widgets/widget.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cDarkGreen,
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lampung",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: setFontSize(85),
                  color: Colors.white
              ),
            ),

            Padding(
              padding: EdgeInsets.all(9),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 17),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cLightGrey
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CardIndex(
                        category: "Desa Berkembang",
                        desa: "Desa Pujodadi",
                        score: 220,
                        logoCategory: "desa_berkembang"
                    ),

                    CardIndex(
                        category: "Desa Tertinggal",
                        desa: "Desa Banjar Negeri",
                        score: 196,
                        logoCategory: "desa_tertinggal"
                    ),

                    CardIndex(
                        category: "Desa Sangat Tertinggal",
                        desa: "Desa Branti",
                        score: 132,
                        logoCategory: "desa_tertinggal"
                    ),

                    CardIndex(
                        category: "Desa Tertinggal",
                        desa: "Desa Bumi Sari",
                        score: 202,
                        logoCategory: "desa_tertinggal"
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
