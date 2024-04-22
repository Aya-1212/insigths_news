import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/features/manager/news_cubit.dart';
import 'package:insigths_news/features/manager/news_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      buildWhen: (previous, current) =>
          current is NewsImageByCategorySucessState ||
          current is NewsImageByCategoryLoadingState,
      builder: (context, state) {
        if (state is NewsImageByCategorySucessState) {
          var news = state.model.articles;
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    return Image.network(
                      news?[index].urlToImage ?? '',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Icon(
                          Icons.error,
                          color: AppColors.grey,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    height: 150,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                  )),
              const Gap(20),
              SmoothPageIndicator(
                controller: PageController(initialPage: currentIndex),
                count: 5,
                axisDirection: Axis.horizontal,
                effect: ScrollingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotColor: AppColors.grey,
                    spacing: 6,
                    dotHeight: 10,
                    dotWidth: 10),
              ),
            ],
          );
        } else if (state is NewsImageByCategoryErrorState) {
          return const Center(
            child: Text('An error occurred!'),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primary,
          ));
        }
      },
    );
  }
}
