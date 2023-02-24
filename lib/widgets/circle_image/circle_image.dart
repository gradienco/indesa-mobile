import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double width;
  final ImageProvider<dynamic> image;

  CircleImage({@required this.width, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: width,
          height: width,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: image)
          )
      ),
    );

    //   Center(
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(radius),
    //     child: Container(
    //       width: radius*2,
    //       height: radius*2,
    //       child: Image(
    //         width: radius*2,
    //         height: radius*2,
    //         fit: BoxFit.cover,
    //         image: image,
    //       )
    //     ),
    //   ),
    // );
  }
}
