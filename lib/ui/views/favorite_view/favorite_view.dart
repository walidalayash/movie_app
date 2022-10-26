import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/l10n.dart';
import '../../shared/ui_helper.dart';
import '../../widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'favorite_view_model.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteViewModel>.reactive(
        viewModelBuilder: () => FavoriteViewModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => model.isBusy
            ? LoadingCircularProgressIndicator()
            :
            //model.isBusy
            // ? Scaffold(
            //     appBar: MyAppBar(), body: LoadingCircularProgressIndicator())
            //:

            Scaffold(
                appBar: MyAppBar('${AppLocalizations.of(context).favorite}'),
                body: ListView.builder(
                  itemCount: model.movies_list.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 2,
                    margin: EdgeInsets.all(8),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 7,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Image.network(
                                //TODO: The backup image should be stored locally.
                                model.movies_list[index].thumb ??
                                    'https://freepikpsd.com/file/2019/10/placeholder-image-png-5-Transparent-Images.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: Column(
                                  children: [
                                    UIHelper.verticalSpaceLarge(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            model.movies_list[index].title!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        UIHelper.horizontalSpaceSmall(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   model.movies_list[index].thumb!,
                                        //   style: TextStyle(),
                                        // ),
                                        UIHelper.horizontalSpaceSmall(),
                                      ],
                                    ),
                                    UIHelper.horizontalSpaceLarge(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          model.movies_list[index].description!,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
