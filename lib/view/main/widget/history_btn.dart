import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HistoryBtn extends StatelessWidget {
  const HistoryBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      child: const Icon(
        FeatherIcons.menu,
      ),
    );
  }
}
