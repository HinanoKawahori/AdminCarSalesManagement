import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorTextWidget extends ConsumerWidget {
  final String text;

  const ErrorTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        text,
      ),
    );
  }
}
