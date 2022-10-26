import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movieapp/ui/shared/ui_helper.dart';

import 'package:stacked/stacked.dart';

import '../../../core/repositories/token_repository/token_repository.dart';
import '../../../generated/l10n.dart';
import '../../../locator.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emaliController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '${AppLocalizations.of(context).warning}',
            style: TextStyle(),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${AppLocalizations.of(context).warning_message}',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                '${AppLocalizations.of(context).ok}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => Center(
                child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 80,
                    child: SizedBox(
                      width: 140,
                      height: 140,
                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Hulu_Logo.svg/2560px-Hulu_Logo.svg.png'),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //text for email
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.black,
                      controller: emaliController,
                      textAlign: TextAlign.center,
                      onSaved: (email) {},
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
                  //text for passowrd
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        cursorColor: Colors.black,
                        controller: passwordController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                          hintText: '${AppLocalizations.of(context).password}',
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
                  UIHelper.verticalSpaceLarge(),
                  //Login button
                  ElevatedButton(
                    onPressed: () async {
                      // setState(() {
                      //   if (emaliController.text == '' ||
                      //       passwordController.text == '') {
                      //     _showMyDialog();
                      //   } else {
                      //     model.moveToMovieViewRoute(context);
                      //   }
                      // });
                      // setState(() async {
                      if (emaliController.text == '' ||
                          passwordController.text == '') {
                        _showMyDialog();
                      } else {
                        await locator<TokenRepository>().fetchToken(
                            emaliController.text, passwordController.text);
                        var token =
                            await FlutterSecureStorage().read(key: 'token');
                        if (token != null) {
                          await model.moveToMovieViewRoute(context);
                        } else {
                          _showMyDialog();
                        }
                      }
                      // });
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
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () async {
                      await model.moveToMovieViewRoute(context);
                    },
                    child: Text(
                      '${AppLocalizations.of(context).skip}',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  //sign up button
                  ElevatedButton(
                    onPressed: () {
                      model.moveToSignUpRoute(context);
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
                ],
              ),
            )));
  }
}
