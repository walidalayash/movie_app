import 'package:flutter/material.dart';
import 'package:movieapp/core/services/key_storage/key_storage_service.dart';
import 'package:movieapp/generated/l10n.dart';
import 'package:movieapp/ui/views/settings/settings_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../app.dart';
import '../../../locator.dart';
import '../../shared/ui_helper.dart';
import '../../widgets/stateless/app_bar.dart';
import '../../widgets/stateless/app_logo.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final formKey = GlobalKey<FormState>();
  int click_count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          appBar: MyAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    UIHelper.verticalSpaceMedium(),
                    UIHelper.verticalSpaceMedium(),
                    Card(
                      margin: EdgeInsets.all(0),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () async {},
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, right: 12, left: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .settings_view_notification,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 15, top: 8),
                                    child: Switch(
                                      //activeColor: Theme.of(context).colorScheme.secondary,
                                      value: locator<KeyStorageService>()
                                          .isNotification!,
                                      onChanged: (_) {
                                        setState(() {
                                          locator<KeyStorageService>()
                                                  .isNotification =
                                              (!locator<KeyStorageService>()
                                                  .isNotification!);
                                        });
                                        //model.update();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    UIHelper.verticalSpaceMedium(),
                    Card(
                      margin: EdgeInsets.all(0),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (ctx) {
                                return StatefulBuilder(
                                  builder: (BuildContext context_,
                                      void Function(void Function()) setState) {
                                    return Container(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 32, horizontal: 16),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                child: AppLogo(
                                                  height: 70.0,
                                                  width: 70.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .show_about,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Spacer(),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 25, right: 12, left: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).about_app,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 15, top: 8),
                                    child: Container(),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceLarge(),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      items: <String>['Arabic', 'English'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: 'English',
                      onChanged: (value) {
                        if (value == 'Arabic') {
                          locator<KeyStorageService>().locale = 'ar';
                        }
                        if (value == 'English') {
                          locator<KeyStorageService>().locale = 'en';
                        }
                        Navigator.pop(context);

                        MyApp.notifier.notifyListeners();
                      },
                    )
                    // TextButton(
                    //   child: Text('Set locale to Arabic'),
                    //   onPressed: () => setState(() {
                    //     locator<KeyStorageService>().language =
                    //         (!locator<KeyStorageService>().language!);
                    //   }),
                    // ),
//                     DropdownButton(

//               // Initial Value
//               value:  locator<KeyStorageService>().locale = 'ar',

//               // Down Arrow Icon
//               icon: const Icon(Icons.keyboard_arrow_down),

//               // Array list of items
//               items: items.map((String items) {
//                 return DropdownMenuItem(
//                   value: items,
//                   child: Text(items),
//                 );
//               }).toList(),
//               // After selecting the desired option,it will
//               // change button value to selected value
//               onChanged: (String? newValue) {
//                 setState(() {
// locator<KeyStorageService>().locale = 'ar';

                    // DropdownButton(
                    //   onChanged: (v) => setState(() {
                    //     locator<KeyStorageService>().locale = 'ar';

                    //     //   MyApp.setLocale(context, Locale(v.toString(), ''));
                    //   }),
                    //   value:
                    //       'ss', // change this line with your way to get current locale to select it as default in dropdown
                    //   items: [
                    //     DropdownMenuItem(value: 'en', child: Text('English')),
                    //     DropdownMenuItem(value: 'ar', child: Text('العربية')),
                    //   ],
                    // )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
