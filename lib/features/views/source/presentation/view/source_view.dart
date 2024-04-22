import 'package:flutter/material.dart';
import 'package:insigths_news/features/views/source/presentation/widgets/sources_list_view.dart';

class SourceView extends StatefulWidget {
  const SourceView({super.key});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            title: const Text('Sources'),
          )),
      body: const Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          children: [
          Expanded(child: SourcesListView()),
        ],),
      )
       
      
    );
  }
}
