import 'package:flutter/cupertino.dart';
import 'package:movieapp/generated/l10n.dart';

import 'exception_indicator.dart';

class NoConnectionIndicator extends StatelessWidget {
  const NoConnectionIndicator({
    Key? key,
    this.onTryAgain,
  }) : super(key: key);

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title:
            AppLocalizations.of(context).no_connection_indicator_no_connection,
        message: AppLocalizations.of(context)
            .no_connection_indicator_try_again_later,
        assetName: '',
        onTryAgain: onTryAgain,
      );
}
