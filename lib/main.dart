import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insigths_news/core/services/app_local_storage.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/features/manager/news_cubit.dart';
import 'package:insigths_news/features/views/upload/presentation/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        home: const SplashView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // fontFamily: GoogleFonts.poppins().fontFamily,
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: AppBarTheme(
                centerTitle: true,
                backgroundColor: AppColors.background,
                foregroundColor: AppColors.white),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.cardColor))),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: AppColors.cardColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.background,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
            )),
      ),
    );
  }
}
