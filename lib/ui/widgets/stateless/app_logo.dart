import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLogo extends StatelessWidget {
  double height;
  double width;

  AppLogo({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.image,
      color: Theme.of(context).colorScheme.onPrimary,
    );
    /*  return Image.asset(
      AssetImages.logo_png,
      height: height,
      width: width,
    );*/
  }
}
