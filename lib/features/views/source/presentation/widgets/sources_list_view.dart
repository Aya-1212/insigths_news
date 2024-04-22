import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insigths_news/core/functions/routing.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/core/utils/text_style.dart';
import 'package:insigths_news/features/manager/news_cubit.dart';
import 'package:insigths_news/features/manager/news_states.dart';
import 'package:insigths_news/features/views/source/presentation/view/news_list_source.dart';

class SourcesListView extends StatefulWidget {
  const SourcesListView({super.key});

  @override
  State<SourcesListView> createState() => _SourcesListViewState();
}

class _SourcesListViewState extends State<SourcesListView> {
  @override
  void initState() {
    super.initState();
 context.read<NewsCubit>().getNewsBySource();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is NewsBySourcesSucessState) {
          var source = state.sources.sources;
          return ListView.builder(
            itemCount: source?.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
//C:\sources\CourseTasks\EraasoftTasksfriday\insigths_news\lib\features\model\source_model\source.dart                  
                  pushto(context, NewsSourceListBuilder(id: source![index].id !,));
                },
                child: Container(
                  height: 75,
                //  width: 10,
                 // padding: const EdgeInsets.all(5),
                 margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(15),),
                      child: Row(
                        children: [
                          Container(
                            height: 75,
                            width: 150,
                              decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),),
                          ),
                         const Gap(10),
                          Expanded(
                            child: Text(source?[index].name ?? '',style: getBodyStyle(),)),
                        ],
                      ) ,
                ),
              );
            },
          );
        } else if (state is NewsBySourcesErrorState) {
          return Center(
            child: Text(
              'An error occurred!',
              style: getTitleStyle(),
            ),
          );
        } else {
          return  Center(
              child: CircularProgressIndicator(color: AppColors.primary,)
              );
        }
      },
    );
  }
}
