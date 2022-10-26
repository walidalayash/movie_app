import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/asset_images.dart';
import 'start_up_view_model.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(context),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Container(
                  child: Image.network(
                    AssetImages.logo_png,
                    height: 250,
                    width: 250,
                  ),
                ),
                model.isBusy
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    : Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
