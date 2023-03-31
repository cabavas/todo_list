import 'package:flutter/material.dart';
import 'package:todo_list/app/models/task_filter_enum.dart';

import '../../../core/notifier/default_change_notifier.dart';

class HomeController extends DefaultChangeNotifier {
  TaskFilterEnum filterSelected = TaskFilterEnum.today;
}
