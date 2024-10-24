import 'package:admin_car_sales_management/src/common_widgets/title_with_back_button.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/case/view/add_or_edit/forms/assessment_info_form.dart';
import 'package:admin_car_sales_management/src/features/case/view/add_or_edit/forms/case_info_form_widget.dart';
import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:admin_car_sales_management/src/common_widgets/blue_button.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';

class AddOrEditCasePage extends HookConsumerWidget {
  const AddOrEditCasePage({
    super.key,
    this.caseId,
  });
  final String? caseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //////////////////////////////案件情報/////////////////////////////////////
    //案件ID
    final TextEditingController caseIdController = useTextEditingController();
    //顧客名
    final TextEditingController customerNameController =
        useTextEditingController();
    //担当者
    final ValueNotifier<Employee?> assignedEmployee = useState(null);
    //案件ステータス
    final ValueNotifier<int> caseStatus = useState(1);

    //顧客名
    final ValueNotifier<Timestamp?> customerBirthDate = useState(null);

    //メールアドレス
    final TextEditingController emailController = useTextEditingController();
    //電話番号
    final TextEditingController phoneController = useTextEditingController();
    //走行距離
    final TextEditingController mileageController = useTextEditingController();
    //住所
    final TextEditingController addressController = useTextEditingController();
    //////////////////////////////査定情報/////////////////////////////////////
    //メーカー
    final TextEditingController manufacturerController =
        useTextEditingController();
    //車種
    final TextEditingController modelController = useTextEditingController();
    //年
    final TextEditingController yearController = useTextEditingController();
    //ランク
    final TextEditingController mileageAssessmentController =
        useTextEditingController();
    //査定価格
    final TextEditingController priceController = useTextEditingController();
    //メモ
    final TextEditingController memoController = useTextEditingController();

    return Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: Padding(
        padding: PaddingStyle.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //タイトル
                TitleWithBackButton(
                  onPressed: () {
                    context.pop();
                  },
                  title: caseId == null ? '案件新規追加' : '案件詳細',
                ),
                //登録or編集ボタン
                BlueButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: caseId == null ? '登録' : '編集',
                ),
              ],
            ),
            HeightMargin.large,
            //フォーム
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: PaddingStyle.detailForm,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        //案件情報フォーム
                        flex: 1,
                        child: CaseInfoForm(
                          caseIdController: caseIdController,
                          customerNameController: customerNameController,
                          emailController: emailController,
                          phoneController: phoneController,
                          addressController: addressController,
                          customerBirthDate: customerBirthDate,
                          caseStatus: caseStatus,
                          employeeData: assignedEmployee,
                        ),
                      ),
                      WidthMargin.large,
                      //査定情報フォーム
                      Expanded(
                        flex: 1,
                        child: AssessmentInfoForm(
                          manufacturerController: manufacturerController,
                          modelController: modelController,
                          yearController: yearController,
                          mileageController: mileageController,
                          mileageAssessmentController:
                              mileageAssessmentController,
                          priceController: priceController,
                          memoController: memoController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
