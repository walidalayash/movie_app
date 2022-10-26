import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/generated/l10n.dart';

import '../../../shared/ui_helper.dart';

class notAuthorizedIndicator extends StatelessWidget {
  const notAuthorizedIndicator({
    Key? key,
  }) : super(key: key);

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
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[300]),
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                '', //
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                AppLocalizations.of(context)
                    .not_authorized_indicator_you_need_to_login_to_see_this_page,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      minimumSize: Size(180, 50),
                      primary: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh,
                        ),
                        UIHelper.horizontalSpaceSmall(),
                        Text(
                          AppLocalizations.of(context)
                              .exception_indicator_try_again,
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      );
}
