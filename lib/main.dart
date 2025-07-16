import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/app_router.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';

import 'core/api/api_manager.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  ApiManager.dioInit();
  Bloc.observer = MyBlocObserver();
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
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoure,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}