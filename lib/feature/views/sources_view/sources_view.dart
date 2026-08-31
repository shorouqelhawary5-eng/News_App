import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/feature/views/sources_view/article_item.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/sources.dart';

class SourcesView extends StatelessWidget {
  SourcesView({super.key});
  final List<Sources> sources = [
    Sources(id: '0', title: 'BBC'),
    Sources(id: '1', title: 'CNN'),
    Sources(id: '2', title: 'Al Jazeera'),
    Sources(id: '3', title: 'Al Arabiya'),
    Sources(id: '4', title: 'Al Jazeera'),
    Sources(id: '5', title: 'Al Jazeera'),
    Sources(id: '6', title: 'Al Jazeera'),
  ];
  final List<ArticleModel> articles = [
    ArticleModel(
      author: 'aaaa',
      title: 'Title',
      description:
          '40-year-old man falls 200 feet to his death while canyoneering at national park',
      publishedAt: '1/8/2003',
    ),
    ArticleModel(
      author: 'bbbb',
      title: 'Title',
      description:
          '40-year-old man falls 200 feet to his death while canyoneering at national park',
      publishedAt: '1/8/2003',
    ),
    ArticleModel(
      author: 'cccc',
      title: 'Title',
      description:
          '40-year-old man falls 200 feet to his death while canyoneering at national park',
      publishedAt: '1/8/2003',
    ),
    ArticleModel(
      author: 'dddd',
      title: 'Title',
      description:
          '40-year-old man falls 200 feet to his death while canyoneering at national park',
      publishedAt: '1/8/2003',
    ),
    ArticleModel(
      author: 'eeee',
      title: 'Title',
      description:
          '40-year-old man falls 200 feet to his death while canyoneering at national park',
      publishedAt: '1/8/2003',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DefaultTabController(
            length: sources.length,
            child: TabBar(
              tabs: sources.map((e) => Tab(text: e.title)).toList(),
              isScrollable: true,
              indicatorColor: ColorsManager.white,
              dividerColor: Colors.transparent,
              labelColor: ColorsManager.white,
              labelStyle: Theme.of(context).textTheme.titleLarge,
              unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
              tabAlignment: TabAlignment.start,
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                return ArticleItem(article: articles[index]);
              },
              separatorBuilder: (_, _) {
                return SizedBox(height: 16.h);
              },
              itemCount: articles.length,
            ),
          ),
        ],
      ),
    );
  }
}
