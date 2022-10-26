import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/asset_images.dart';

/// Indicates that no items were found. ß
class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({
    required this.title,
    this.message,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) => Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary),
              child: SvgPicture.asset(
                AssetImages.empty_view,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ));
}
