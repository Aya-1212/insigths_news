import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insigths_news/features/manager/news_cubit.dart';
import 'package:insigths_news/features/views/source/presentation/widgets/articles_list.dart';


class NewsSourceListBuilder extends StatefulWidget {
  const NewsSourceListBuilder({
    super.key,
     required this.id
  });
  final String id ;

  @override
  State<NewsSourceListBuilder> createState() => _NewsSourceListBuilderState();
}

class _NewsSourceListBuilderState extends State<NewsSourceListBuilder> {
  @override
  void initState() {
    context.read<NewsCubit>().getArticlesBySource(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(55), child: Text('Articles')),
      body:Padding(
        padding:  EdgeInsets.all(20),
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column( children: [
            Expanded(child: ArticlesListBuilder()),
          ],),
        ),
      ) 
    );
  }
}
