import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddOrEditCasePage extends HookConsumerWidget {
  const AddOrEditCasePage({
    super.key,
    required this.caseId,
  });
  final String? caseId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            (caseId != null) ? const Text('編集画面') : const Text('新規作成画面'),
          ],
        ),
      ),
    );
  }
}
