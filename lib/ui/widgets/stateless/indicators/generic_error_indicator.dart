import 'package:flutter/cupertino.dart';
import 'package:movieapp/generated/l10n.dart';

import 'exception_indicator.dart';

/// Indicates that an unknown error occurred.
class GenericErrorIndicator extends StatelessWidget {
  const GenericErrorIndicator({
    Key? key,
    this.onTryAgain,
  }) : super(key: key);

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: AppLocalizations.of(context)
            .generic_error_indicator_error_while_fetching_data, //
        message: ''
            '.',
        assetName: '',
        onTryAgain: onTryAgain,
      );
}
