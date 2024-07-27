import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mx_flutter_test/shared/shared.dart';

import 'utils/app_router.dart';
import 'utils/utils.dart';

Future<void> main() async {
  await initApp();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(apiUtilProvider).setupDio();
        return null;
      },
      [],
    );
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (_, child) {
        return MaterialApp.router(
          title: 'MyEG Assesment App',
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
