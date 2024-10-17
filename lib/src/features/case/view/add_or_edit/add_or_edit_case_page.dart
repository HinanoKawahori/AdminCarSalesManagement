import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddOrEditCasePage extends HookConsumerWidget {
  const AddOrEditCasePage({super.key, String? caseId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('AddOrEditCasePage'),
      ),
    );
  }
}
