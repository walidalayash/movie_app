import 'package:flutter/material.dart';
import 'package:movieapp/ui/shared/ui_helper.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/actor/actor.dart';
import '../../../generated/l10n.dart';
import '../../widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'actor_view_model.dart';

// ignore: must_be_immutable
class ActorView extends StatefulWidget {
  Actor actor;
  ActorView(this.actor);

  @override
  _ActorViewState createState() => _ActorViewState();
}

class _ActorViewState extends State<ActorView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(ActorView oldWidget) {
    // if (oldWidget.listPreferences != widget.listPreferences) {
    //   _pagingController.refresh();
    // }
    super.didUpdateWidget(oldWidget);
  }

  TextEditingController? commentController;
  FocusNode? commentFocusNode;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();

    commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    commentController!.dispose();

    super.dispose();
  }

  int x = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActorViewModel>.reactive(
        viewModelBuilder: () => ActorViewModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => model.isBusy
            ? Scaffold(
                //  drawer: Drawer(child: CustomerDrawerMenu()),
                appBar: MyAppBar(),
                body: LoadingCircularProgressIndicator())
            : Scaffold(
                appBar: MyAppBar(
                    '${AppLocalizations.of(context).main_view_actors}'),
                body: model.isBusy
                    ? LoadingCircularProgressIndicator()
                    : SingleChildScrollView(
                        child: Column(children: [
                          UIHelper.verticalSpaceLarge(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('${AppLocalizations.of(context).name}:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  UIHelper.verticalSpaceSmall(),
                                  Text(
                                    widget.actor.name!.toUpperCase(),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  UIHelper.verticalSpaceMedium(),
                                  Text('${AppLocalizations.of(context).born}:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  UIHelper.verticalSpaceSmall(),
                                  Text(
                                    'June 1, 1937 in Memphis, Tennessee, USA',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                              Card(
                                elevation: 2,
                                child: Image.network(
                                  //TODO: The backup image should be stored locally.
                                  widget.actor.img ??
                                      'https://freepikpsd.com/file/2019/10/placeholder-image-png-5-Transparent-Images.png',
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.black),
                          UIHelper.verticalSpaceLarge(),
                          Text('${AppLocalizations.of(context).movies}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          UIHelper.verticalSpaceLarge(),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            crossAxisCount: 2,
                            children: List.generate(10, (content) {
                              x = x + 1;
                              return Card(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Image.network(
                                          model.movies_list[x].img!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                model.movies_list[x].title!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Thriller',
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              );
                            }),
                          ),
                        ]),
                      ),
              ));
  }
}
