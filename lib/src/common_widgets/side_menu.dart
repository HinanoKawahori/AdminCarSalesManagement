import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return
        // サイドバー
        Container(
      width: 200,
      color: ColorStyle.mainGrey,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('ダッシュボード'),
            onTap: () {
              // ダッシュボード画面に遷移
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('従業員'),
            onTap: () {
              // 現在の画面なので何もしない
            },
            selected: true,
          ),
          ListTile(
            leading: const Icon(Icons.car_rental),
            title: const Text('車両'),
            onTap: () {
              // 車両管理画面に遷移
            },
          ),
        ],
      ),
    );
  }
}
