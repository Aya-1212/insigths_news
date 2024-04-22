import 'dart:io';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insigths_news/core/services/app_local_storage.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/core/utils/text_style.dart';
import 'package:insigths_news/features/manager/news_cubit.dart';
import 'package:insigths_news/features/views/home/presentation/widgets/carousel_smooth_page.dart';
import 'package:insigths_news/features/views/home/presentation/widgets/news_list_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 late String? name;
 late String? path;

  @override
  void initState() {
     context.read<NewsCubit>().getNewsImageByCategory();
    name = AppLocalStorage.getUserData('name');
    path = AppLocalStorage.getUserData('image');
    super.initState();
  }
   
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: DefaultTabController(
              length: 4,
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello $name',
                            style: getTitleStyle(),
                          ),
                          Text(
                            'Have a nice day',
                            style: getSmallStyle(),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: FileImage(File(path!)) as ImageProvider,
                      radius: 30,
                    ),
                  ],
                ),
                ////////////////////////////////////////////////////HomeHeader
                const Gap(30),
                const ImageView(),
                const Gap(20),
                ButtonsTabBar(
                  tabs: const [
                    Tab(
                      text: 'Science',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                  ],
                  labelStyle: getSmallStyle(color: AppColors.black),
                  unselectedLabelStyle: getSmallStyle(color: AppColors.white),
                  backgroundColor: AppColors.primary,
                  buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  height: 40,
                  radius: 10,
                  unselectedBackgroundColor: AppColors.cardColor,
                ),
                const Gap(20),
                const Expanded(
                  child: TabBarView(children: [
                    NewsListBuilder(
                      category: 'Science',
                    ),
                    NewsListBuilder(
                      category: 'Entertainment',
                    ),
                    NewsListBuilder(
                      category: 'Sports',
                    ),
                    NewsListBuilder(
                      category: 'Business',
                    ),
                  ]),
                ),
              ])),
        ),
      ),
    );
  }
}
