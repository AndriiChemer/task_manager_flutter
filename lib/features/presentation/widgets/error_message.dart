import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/features/domain/network/general_connection_error.dart';

String getConnectionErrorSting(BuildContext context, GeneralConnectionError error) {
  return error.when(
    noConnection: () => context.getString('no_internet'),
    timeout: () => context.getString('timeout'),
    somethingWentWrong: () => context.getString('something_went_wrong')
  );
}