import 'package:admin_car_sales_management/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/config/utils/style/color_style.dart';
import 'src/features/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: ColorStyle.hoverGrey,
        ),
        colorScheme: const ColorScheme.light(
          primary: ColorStyle.blue,
          onPrimary: ColorStyle.white,
          surface: ColorStyle.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return ColorStyle.hoverGrey; // タップ時の色
                }
                return null; // デフォルトの色
              },
            ),
          ),
        ),
      ),
    );
  }
}
