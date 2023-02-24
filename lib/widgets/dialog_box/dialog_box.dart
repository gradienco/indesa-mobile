import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';

class DialogBox{
  void showWarningDialog(BuildContext context, int unAnsweredQuestion){
    var alertDialog = AlertDialog(
      actions: [

        FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: cDarkGreen,
          child: Text(
            "Oke",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        )
      ],
      content: Container(
        height: 75,
        child: Text(
          "Terdapat $unAnsweredQuestion pertanyaan yang belum dijawab, mohon jawab semua pertanyaan untuk melanjutkan",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: cDarkGreen
          ),
        ),
      ),
    );

    showDialog(context: context, builder: (BuildContext context) => alertDialog);
  }

}
