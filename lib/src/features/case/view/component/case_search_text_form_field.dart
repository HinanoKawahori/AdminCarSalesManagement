import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../config/utils/style/color_style.dart';
import '../../../../config/utils/style/custom_font_style.dart';
import '../../data_model/case.dart';

class CaseSearchTextFormField extends HookConsumerWidget {
  final List<Case> caseList;
  final ValueNotifier<String> searchWord;
  final ValueNotifier<String> searchType;

  const CaseSearchTextFormField({
    super.key,
    required this.caseList,
    required this.searchWord,
    required this.searchType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = useTextEditingController();
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: searchController,
        cursorColor: ColorStyle.mainBlack,
        cursorHeight: 17,
        decoration: InputDecoration(
          fillColor: ColorStyle.white,
          filled: true,
          hoverColor: ColorStyle.white,
          contentPadding: const EdgeInsets.only(left: 20),
          suffixIcon: SizedBox(
            width: 80,
            child: Row(
              children: [
                //
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                    color: ColorStyle.mainBlack,
                  ),
                  onPressed: () {
                    //検索したい言葉を、更新する
                    searchWord.value = searchController.text;
                    print(searchWord.value);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.clear,
                    size: 20,
                    color: ColorStyle.mainBlack,
                  ),
                  onPressed: () {
                    searchController.clear();
                    searchWord.value = '';
                    print(searchWord.value);
                  },
                ),
              ],
            ),
          ),
          // 選択されたときの枠線の色
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorStyle.mainWhite,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          // 選択されていないときの枠線の色
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorStyle.mainWhite,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          //エラー時の枠線の色
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorStyle.validationRed,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          //エラー時にフォーカスされたときの枠線の色
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorStyle.validationRed,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          hintText: '入力してください',
          hintStyle: const TextStyle(
            color: ColorStyle.mainGrey,
            fontSize: CustomFontSize.small,
          ),
        ),
      ),
    );
  }
}
