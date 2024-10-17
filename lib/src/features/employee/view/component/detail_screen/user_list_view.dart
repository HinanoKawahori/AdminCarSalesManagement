// import 'package:admin_car_sales_management/src/features/employee/data_model/employee.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../../config/utils/style/color_style.dart';
// import '../../../../../config/utils/style/custom_font_style.dart';
// import '../../../../../config/utils/style/height_margin.dart';
// import '../../../../../config/utils/style/width_margin.dart';

// class UserListView extends HookConsumerWidget {
//   const UserListView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ValueNotifier<List<Employee>> employeeList = useState([]);
//     final ValueNotifier<List<Employee>> searchEmployeeList = useState([]);
//     final ValueNotifier<List<String?>> subscriptionList = useState([]);
//     final TextEditingController searchController = useTextEditingController();
//     final ValueNotifier<bool> isLoading = useState(false);
//     final ValueNotifier<bool> isSubscription = useState(false);

//     useEffect(() {
//       Future(() async {
//         isLoading.value = true;
//         employeeList.value =
//             await ref.read(userControllerProvider.notifier).getAllUserList();
//         searchEmployeeList.value = employeeList.value;
//         for (Employee employee in employeeList.value) {
//           //TODO ⭐️検索処理？
//           // final String? subscriptionUserId = await ref
//           //     .read(squareControllerProvider.notifier)
//           //     .getSubscriptionByUserId(userId: employee.userId);
//           // if (subscriptionUserId != null) {
//           //   subscriptionList.value.add(subscriptionUserId);
//           // }
//         }
//         isLoading.value = false;
//       });
//       return null;
//     }, []);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         HeightMargin.normal,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 const Text(
//                   '会員一覧',
//                   style: TextStyle(
//                     fontSize: CustomFontSize.normal,
//                     color: ColorStyle.mainBlack,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 WidthMargin.large,
//                 SearchTextFormField(
//                   userList: employeeList.value,
//                   searchUserList: searchEmployeeList,
//                   searchController: searchController,
//                   isSubscription: isSubscription,
//                 ),
//               ],
//             ),
//             SubscriptionNumber(
//               subscriptionNumber: subscriptionList.value.length,
//               isLoading: isLoading,
//             ),
//           ],
//         ),
//         HeightMargin.small,
//         isLoading.value
//             ? const SizedBox.shrink()
//             : Align(
//                 alignment: Alignment.centerRight,
//                 child: InkWell(
//                   onTap: () {
//                     searchController.clear();
//                     if (isSubscription.value) {
//                       isSubscription.value = false;
//                       searchUserList.value = userList.value;
//                     } else {
//                       isSubscription.value = true;
//                       // searchUserList.value = ref
//                       //     .read(userControllerProvider.notifier)
//                       //     .searchSubscription(
//                       //         userList.value, subscriptionList.value);
//                     }
//                   },
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       isSubscription.value
//                           ? Container(
//                               decoration: const BoxDecoration(
//                                 color: ColorStyle.mainBlack,
//                               ),
//                               child: const Padding(
//                                 padding: EdgeInsets.all(2.0),
//                                 child: Icon(
//                                   Icons.filter_alt,
//                                   color: ColorStyle.mainGrey,
//                                 ),
//                               ),
//                             )
//                           : const Icon(
//                               Icons.filter_alt,
//                               color: ColorStyle.mainBlack,
//                             ),
//                       WidthMargin.minimum,
//                       const Text(
//                         'サブスク加入者のみに切り替え',
//                         style: TextStyle(
//                           color: ColorStyle.mainBlack,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//         HeightMargin.small,
//         Expanded(
//           child: CustomDataTable(
//             columns: const [
//               DataColumn2(
//                 label: Text(
//                   'ユーザーID',
//                 ),
//                 size: ColumnSize.S,
//               ),
//               DataColumn2(
//                 label: Text(
//                   'ユーザーネーム',
//                 ),
//                 size: ColumnSize.S,
//               ),
//               DataColumn2(
//                 label: Text(
//                   'メールアドレス',
//                 ),
//                 size: ColumnSize.S,
//               ),
//               DataColumn2(
//                 label: Text('権限'),
//                 size: ColumnSize.S,
//               ),
//               // DataColumn2(
//               //   label: Text('ステータス'),
//               //   size: ColumnSize.S,
//               // ),
//               DataColumn2(
//                 label: Text('ポイント'),
//                 size: ColumnSize.S,
//               ),
//               DataColumn2(
//                 label: Text('登録日時'),
//               ),
//             ],
//             onPageChanged: (value) {},
//             source: RowSourceUserData(
//               context: context,
//               count: searchUserList.value.length,
//               userDataList: searchUserList.value,
//               ref: ref,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
