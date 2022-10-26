import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:movieapp/ui/shared/ui_helper.dart';
import 'package:movieapp/ui/views/sign_up/sign_up_model.dart';

import 'package:movieapp/ui/views/startup/start_up_view.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/l10n.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpModel>.nonReactive(
        viewModelBuilder: () => SignUpModel(),
        onModelReady: (model) => model,
        builder: (context, model, child) => SafeArea(
                child: Scaffold(
                    body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          hintText: '${AppLocalizations.of(context).name}',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.person_add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //text for passowrd
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          //  controller: passwordController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(),
                            ),
                            hintText: '${AppLocalizations.of(context).email}',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          //  controller: passwordController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(),
                            ),
                            hintText: '${AppLocalizations.of(context).age}',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.view_agenda,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          //  controller: passwordController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(),
                            ),
                            hintText:
                                '${AppLocalizations.of(context).favorite_categories}',
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          //  controller: passwordController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(),
                            ),
                            hintText:
                                '${AppLocalizations.of(context).password}',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceExtraLarge(),
                    ElevatedButton(
                      onPressed: () async {
                        await model.moveToMovieViewRoute(context);
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
                      child: Text(
                        '${AppLocalizations.of(context).sign_Up}',
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await model.moveToLoginViewRoute(context);
                      },
                      child: Text(
                        '${AppLocalizations.of(context).already_have_an_account}',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ]),
            ))));
  }
}
