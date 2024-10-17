import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddEmployeePage extends HookConsumerWidget {
  const AddEmployeePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Text('AddEmployeePage'),
    );
  }
}
