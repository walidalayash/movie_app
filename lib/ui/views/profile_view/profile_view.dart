import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:movieapp/ui/shared/ui_helper.dart';
import 'package:movieapp/ui/views/profile_view/profile_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/l10n.dart';
import '../../widgets/stateless/app_bar.dart';
import '../../widgets/stateless/drawer/customer_drawer_menu.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
        appBar: MyAppBar('${AppLocalizations.of(context).main_view_profile}'),
        drawer: Drawer(child: CustomerDrawerMenu()),
        body: model.token == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('Login before')),
                  UIHelper.verticalSpaceLarge(),
                  ElevatedButton(
                    onPressed: () {
                      model.moveToLoginViewRoute(context);
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                    child: Text(
                      '${AppLocalizations.of(context).login}',
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIHelper.verticalSpaceLarge(),
                    InkWell(
                      child: Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 80,
                            ),
                          ),
                          edit == true
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 130, right: 100),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      onTap: () {
                        edit == true
                            ? model.moveToAddPhotoRoute(context)
                            : log(edit.toString());
                      },
                    ),
                    UIHelper.verticalSpaceMedium(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              if (edit == false) {
                                edit = true;
                              } else {
                                edit = false;
                              }
                            });
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ))),
                          child: edit == false
                              ? Text(
                                  'Edit',
                                )
                              : Text(
                                  'Ok',
                                )),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    //name
                    edit == false
                        ? Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 3.0), // Set border width
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20.0)), // Set rounded corner radius
                            ),
                            child: Row(
                              children: [
                                Text('Name: '),
                                Text(model.User_list!.email!),
                              ],
                            ),
                          )
                        : Container(
                            width: 300,
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                              //   controller: emaliController,
                              textAlign: TextAlign.center,
                              onSaved: (email) {},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                                hintText: 'New name',
                              ),
                            ),
                          ),
//email
                    edit == false
                        ? Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 3.0), // Set border width
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20.0)), // Set rounded corner radius
                            ),
                            child: Row(
                              children: [
                                Text('Email: '),
                                Text(model.User_list!.email!),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              UIHelper.verticalSpaceMedium(),
                              Container(
                                width: 300,
                                height: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  //   controller: emaliController,
                                  textAlign: TextAlign.center,
                                  onSaved: (email) {},
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(),
                                    ),
                                    hintText: 'New emali',
                                  ),
                                ),
                              ),
                            ],
                          ),
//age
                    edit == false
                        ? Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 3.0), // Set border width
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20.0)), // Set rounded corner radius
                            ),
                            child: Row(
                              children: [
                                Text('Age: '),
                                Text('23'),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              UIHelper.verticalSpaceMedium(),
                              Container(
                                width: 300,
                                height: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  //   controller: emaliController,
                                  textAlign: TextAlign.center,
                                  onSaved: (email) {},
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(),
                                    ),
                                    hintText: 'New age',
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3.0), // Set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)), // Set rounded corner radius
                      ),
                      child: Text('Favorite Categories'),
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3.0), // Set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              20.0)), // Set rounded corner radius
                        ),
                        child: Text('Favorite Movies'),
                      ),
                      onTap: () {
                        model.moveToFavoriteRoute(context);
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
