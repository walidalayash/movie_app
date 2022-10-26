import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/actor/actor.dart';
import '../../../shared/ui_helper.dart';
import 'actor_tile_view_model.dart';

/// A list tile for an article.
class ActorTile extends StatelessWidget {
  final Actor actor;
  final ValueChanged<Actor> onChanged;

  const ActorTile({required this.actor, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActorTileViewModel>.nonReactive(
      viewModelBuilder: () => ActorTileViewModel(),
      onModelReady: (model) => model.init(actor),
      builder: (context, model, child) => InkWell(
        onTap: () async {
          await model.moveToActorViewRoute(context);
        },
        child: Card(
          elevation: 2,
          margin: EdgeInsets.all(8),
          child: Container(
            height: MediaQuery.of(context).size.height / 7,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.r,
                    child: Image.network(
                      actor.thumb ??
                          'https://freepikpsd.com/file/2019/10/placeholder-image-png-5-Transparent-Images.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: [
                          UIHelper.verticalSpaceLarge(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  actor.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                            ],
                          ),
                          UIHelper.horizontalSpaceLarge(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
