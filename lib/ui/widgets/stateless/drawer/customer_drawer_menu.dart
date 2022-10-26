import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';

import '../../../../generated/l10n.dart';

import 'customer_drawer_menu_view_model.dart';

class CustomerDrawerMenu extends StatelessWidget {
  const CustomerDrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerDrawerMenuViewModel>.nonReactive(
        viewModelBuilder: () => CustomerDrawerMenuViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Center(
                        child: SizedBox(
                      width: 140,
                      height: 140,
                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Hulu_Logo.svg/2560px-Hulu_Logo.svg.png'),
                    )),
                  ),
                  model.token != null
                      ? ListTile(
                          title:
                              Text('${AppLocalizations.of(context).favorite}'),
                          onTap: () async {
                            await model.moveToFavoriteViewRoute(context);
                          },
                        )
                      : Container(),
                  ListTile(
                    title: Text('${AppLocalizations.of(context).settings}'),
                    onTap: () async {
                      await model.moveToSettingsViewRoute(context);
                    },
                  ),
                  model.token == null
                      ? ListTile(
                          title: Text('${AppLocalizations.of(context).login}'),
                          onTap: () async {
                            await model.moveToLoginViewRoute(context);
                          },
                        )
                      : ListTile(
                          title: Text('${AppLocalizations.of(context).logout}'),
                          onTap: () async {
                            await FlutterSecureStorage().delete(key: 'token');
                            await model.moveToLoginViewRoute(context);
                          },
                        )
                ],
              ),
            ));
  }
}
