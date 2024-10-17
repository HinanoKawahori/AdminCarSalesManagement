
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../config/utils/style/color_style.dart';
// import '../config/utils/style/height_margin.dart';

// class CustomDateTimePicker extends HookConsumerWidget {
//   const CustomDateTimePicker({
//     super.key,
//     required this.label,
//   });

//   final String label;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         HeightMargin.small,
//         Container(
//           decoration: BoxDecoration(
//             color: ColorStyle.mainWhite,
//             border: Border.all(
//               color: ColorStyle.mainGrey,
//             ),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: InkWell(
//             onTap: () async {
//               final DateTime? pickedDate = await showDatePicker(
//                 context: context,
//                 initialDate: (ref.read(customerBirthDateControllerProvider) !=
//                         null)
//                     ? ref.read(customerBirthDateControllerProvider)!.toDate()
//                     : DateTime.now(),
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2101),
//               );

//               if (pickedDate != null) {
//                 ref
//                     .read(customerBirthDateControllerProvider.notifier)
//                     .stateChange(Timestamp.fromDate(pickedDate));
//               }
//             },
//             child: InputDecorator(
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     ref.watch(customerBirthDateControllerProvider) != null
//                         ? createDateText(
//                             ref.read(customerBirthDateControllerProvider)!)
//                         : '選択してください',
//                     style: TextStyle(
//                       color:
//                           ref.watch(customerBirthDateControllerProvider) != null
//                               ? ColorStyle.mainBlack
//                               : ColorStyle.mainGrey,
//                     ),
//                   ),
//                   const Icon(Icons.calendar_today),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
