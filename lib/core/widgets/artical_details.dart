import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insigths_news/core/functions/routing.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/core/utils/text_style.dart';
import 'package:insigths_news/features/model/news_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesDetails extends StatelessWidget {
  final Article newsArticle;
  const ArticlesDetails({super.key, required this.newsArticle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          scrollDirection: Axis.vertical,

          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                newsArticle.urlToImage ?? '',
                width: double.infinity,
                height: 250,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Icon(
                    Icons.error,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Text(
              '${newsArticle.title ?? ''} -${newsArticle.source ?? ''}',
              style: getBodyStyle(),
            ),
            const Gap(20),
            Text(
              newsArticle.author ?? '',
              style: getTitleStyle(color: AppColors.primary),
            ),
            const Gap(10),
            Text(
              newsArticle.publishedAt ?? '',
              style: getBodyStyle(color: AppColors.grey),
            ),
            const Gap(10),
            Text(
              newsArticle.description ?? '',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
            ),
            onPressed: () async {
              await launchUrl(Uri.parse(newsArticle.url ?? ''));
            },
            child: Text(
              'Go to Website',
              style: getBodyStyle(),
            )),
      ),
    );
  }
}
