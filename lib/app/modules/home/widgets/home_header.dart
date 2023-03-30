import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/auth_provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Selector<AuthProvider, String>(
            builder: (_, value, __) {
              return Text(
                'E aí, $value!',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              );
            },
            selector: (context, authProvider) =>
                authProvider.user?.displayName ?? 'Nome não informado',
          ),
        ),
      ],
    );
  }
}
