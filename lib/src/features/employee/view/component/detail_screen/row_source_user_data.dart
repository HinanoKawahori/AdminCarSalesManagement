// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:forward_life_admin/src/common_widget/show_toast.dart';
// import 'package:forward_life_admin/src/config/routing/router_utils.dart';
// import 'package:forward_life_admin/src/config/utils/style/color_style.dart';
// import 'package:forward_life_admin/src/feature/point_log/controller/point_log_controller.dart';
// import 'package:forward_life_admin/src/feature/point_log/data_model/point_log.dart';
// import 'package:forward_life_admin/src/feature/user/data_model/user_data.dart';
// import 'package:forward_life_admin/src/function/switch_data.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class RowSourceUserData extends DataTableSource {
//   final BuildContext context;
//   final List<UserData> userDataList;
//   final int count;
//   final WidgetRef ref;
//   RowSourceUserData({
//     required this.context,
//     required this.userDataList,
//     required this.count,
//     required this.ref,
//   });

//   @override
//   DataRow? getRow(int index) {
//     if (index < rowCount) {
//       return recentFileDataRow(
//         userDataList[index],
//         context,
//         ref,
//       );
//     } else {
//       return null;
//     }
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => count;

//   @override
//   int get selectedRowCount => 0;
// }

// DataRow recentFileDataRow(
//   UserData userData,
//   BuildContext context,
//   WidgetRef ref,
// ) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             InkWell(
//               onTap: () {
//                 context.goNamed(
//                   AppRoute.editUser.name,
//                   queryParameters: {'userId': userData.userId},
//                 );
//               },
//               child: SizedBox(
//                 width: 80,
//                 child: Text(
//                   userData.userId,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: ColorStyle.link,
//                     decoration: TextDecoration.underline,
//                     decorationColor: ColorStyle.link,
//                   ),
//                 ),
//               ),
//             ),
//             Tooltip(
//               message: 'コピー',
//               child: IconButton(
//                 onPressed: () {
//                   Clipboard.setData(ClipboardData(text: userData.userId));
//                   showToast(toastMessage: 'ユーザーIDをコピーしました！');
//                 },
//                 icon: const Icon(
//                   Icons.copy,
//                   color: ColorStyle.link,
//                   size: 16,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       DataCell(
//         Row(
//           children: [
//             SizedBox(
//               width: 80,
//               child: Text(
//                 userData.userName,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Tooltip(
//               message: 'コピー',
//               child: IconButton(
//                 onPressed: () {
//                   Clipboard.setData(ClipboardData(text: userData.userName));
//                   showToast(toastMessage: 'ユーザーネームをコピーしました！');
//                 },
//                 icon: const Icon(
//                   Icons.copy,
//                   color: ColorStyle.mainBlack,
//                   size: 16,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       DataCell(
//         Row(
//           children: [
//             SizedBox(
//               width: 80,
//               child: Text(
//                 userData.email,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Tooltip(
//               message: 'コピー',
//               child: IconButton(
//                 onPressed: () {
//                   Clipboard.setData(ClipboardData(text: userData.email));
//                   showToast(toastMessage: 'メールアドレスをコピーしました！');
//                 },
//                 icon: const Icon(
//                   Icons.copy,
//                   size: 16,
//                 ),
//                 color: ColorStyle.mainBlack,
//               ),
//             )
//           ],
//         ),
//       ),
//       DataCell(Text(switchRoleToString(userData.role))),
//       // DataCell(Text(switchStatusToString(userData.status))),
//       ref
//           .watch(watchPointLogListControllerProvider(userId: userData.userId))
//           .when(
//         error: (error, stackTrace) {
//           return const DataCell(Text(''));
//         },
//         loading: () {
//           return const DataCell(Text(''));
//         },
//         data: (List<PointLog> pointLogList) {
//           return DataCell(
//             SizedBox(
//               width: 60,
//               child: Text(
//                 ref
//                     .read(pointLogControllerProvider.notifier)
//                     .totalPoint(pointLogList: pointLogList)
//                     .toString(),
//                 textAlign: TextAlign.end,
//               ),
//             ),
//           );
//         },
//       ),
//       DataCell(Text(switchDateText(userData.createdAt))),
//     ],
//   );
// }
