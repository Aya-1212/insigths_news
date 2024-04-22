import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insigths_news/core/constants/assets_icons.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/features/views/home/presentation/view/home_view.dart';
import 'package:insigths_news/features/views/profile/presentation/view/profile_view.dart';
import 'package:insigths_news/features/views/search/presentation/view/search_view.dart';
import 'package:insigths_news/features/views/source/presentation/view/source_view.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key, this.page});
  final int? page;
  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  List<Widget> view = [
    const HomeView(),
    SearchView(),
    const SourceView(),
    const ProfileView(),
  ];
  int selectedIndex = 0;
  @override
  void initState() {
       selectedIndex = widget.page??0;
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcons.home),
                label: 'Home',
                activeIcon: SvgPicture.asset(
                  AssetsIcons.home,
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcons.search),
                label: 'search',
                activeIcon: SvgPicture.asset(
                  AssetsIcons.search,
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcons.source),
                label: 'source',
                activeIcon: SvgPicture.asset(
                  AssetsIcons.source,
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcons.profile),
                label: 'profile',
                activeIcon: SvgPicture.asset(
                  AssetsIcons.profile,
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                )),
          ]),
      body: view[selectedIndex],
    );
  }
}
