import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/app_router.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';

import 'core/utils/app_theme.dart';
import 'core/utils/bloc_observer.dart';
void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp( GymApp(appRouter: AppRouter(),));
}
class GymApp extends StatelessWidget {
  final AppRouter appRouter;
  const GymApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.registerScreen,
        onGenerateRoute: appRouter.generateRoure,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}