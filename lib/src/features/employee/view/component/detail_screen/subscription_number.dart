import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common_widgets/loading_widget.dart';
import '../../../../../config/utils/style/color_style.dart';
import '../../../../../config/utils/style/custom_font_style.dart';

class SubscriptionNumber extends HookConsumerWidget {
  final int subscriptionNumber;
  final ValueNotifier<bool> isLoading;
  const SubscriptionNumber({
    super.key,
    required this.subscriptionNumber,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 45,
      width: 200,
      decoration: BoxDecoration(
        color: ColorStyle.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: isLoading.value
            ? const LoadingWidget(
                color: ColorStyle.mainWhite,
              )
            : Text(
                'サブスク加入者数: $subscriptionNumber名',
                style: const TextStyle(
                  color: ColorStyle.mainWhite,
                  fontSize: CustomFontSize.small,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
