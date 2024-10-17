import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingWidget extends ConsumerWidget {
  final double? height;
  final double? width;
  const LoadingWidget({
    super.key,
    this.height,
    this.width,
    required Color color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        height: height ?? 100,
        width: width ?? 100,
        child: const CupertinoActivityIndicator(),
      ),
    );
  }
}
