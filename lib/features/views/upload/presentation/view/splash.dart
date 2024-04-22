import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insigths_news/core/constants/assets_images.dart';
import 'package:insigths_news/core/functions/routing.dart';
import 'package:insigths_news/core/services/app_local_storage.dart';
import 'package:insigths_news/core/utils/text_style.dart';
import 'package:insigths_news/core/widgets/navigation_bar.dart';
import 'package:insigths_news/features/views/upload/presentation/view/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        bool isUpload = AppLocalStorage.getUserData('isUpload') ?? false;
        pushWithReplacement(context,
            (isUpload) ? const NavigationBarView() : const UploadView());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImages.logo),
            const Gap(50),
            Text(
              'Insights News',
              style: getTitleStyle(),
            ),
            const Gap(15),
            Text(
              'Stay Informed, Anytime, Anywhere.',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
