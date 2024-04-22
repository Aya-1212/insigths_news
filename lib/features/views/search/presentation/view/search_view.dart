import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:insigths_news/core/constants/assets_icons.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/core/utils/text_style.dart';
import 'package:insigths_news/features/manager/news_cubit.dart';
import 'package:insigths_news/features/views/search/presentation/view/list_news_search.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  SearchView({super.key});

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: AppBar(
            title: const Text('Find Your News'),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: getBodyStyle(),
                    decoration: InputDecoration(
                        hintText: 'Search For News',
                        hintStyle: getBodyStyle(fontWeight: FontWeight.w400)),
                    controller: textController,
                  ),
                ),
                const Gap(10),
                SizedBox(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        context
                            .read<NewsCubit>()
                            .getNewsBySearch(textController.text);
                      },
                      child: SvgPicture.asset(AssetsIcons.search),
                    )),
              ],
            ),
            const Gap(20),
            ///////////////////////////////
       const Expanded(child: NewsListSearchBuilder()),
          ],
        ),
      ),
    );
  }
}
