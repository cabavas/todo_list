import 'package:flutter/material.dart';
import 'package:todo_list/app/modules/home/widgets/task.dart';

import '../../../core/ui/theme_extensions.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'TASKS DE HOJE',
            style: context.titleStyle,
          ),
          Column(
            children: const [
              Task(),
            ],
          ),
        ],
      ),
    );
  }
}
