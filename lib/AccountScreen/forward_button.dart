import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ForwardButton extends StatelessWidget {
  final Function() onTap;
  const ForwardButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: DerwiseTheme.backgroundApp,
        child: const Icon(Ionicons.chevron_forward_outline),
      ),
    );
  }
}
