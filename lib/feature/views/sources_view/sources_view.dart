import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/data/apis/api_services.dart';
import 'package:news_app/data/data_services/artical/artical_api_data_source.dart';
import 'package:news_app/data/repositry/artical/artical_repositry_imp.dart';
import 'package:news_app/data/data_services/source/source_api_data_source_imp.dart';
import 'package:news_app/data/repositry/source/source_repositry_imp.dart';
import 'package:news_app/feature/views/sources_view/article_item.dart';

import 'package:news_app/models/category_models.dart';
import 'package:news_app/provider/artical_view_model.dart';
import 'package:news_app/provider/source_view_model.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});
  final CategoryModels category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourceViewModel sourceViewModel;
  late ArticalViewModel articalViewModel;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    sourceViewModel = SourceViewModel(
      sourceRepositoryImp: SourceRepositoryImp(
        sourceDataSource: SourceApiDataSourceImp(apiServices: ApiServices()),
      ),
    );
    articalViewModel = ArticalViewModel(
      articalRepositryImp: ArticalRepositryImp(
        articalDataSource: ArticalApiDataSourceImp(apiServices: ApiServices()),
      ),
    );

    await sourceViewModel.loadSources(widget.category);

    if (sourceViewModel.errorMessage.isEmpty &&
        sourceViewModel.sources.isNotEmpty) {
      await articalViewModel.loadArticles(sourceViewModel.sources[0]);
    }
  }

  Widget _buildErrorMessage(BuildContext context, String message) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: colorScheme.onErrorContainer),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SourceViewModel>.value(value: sourceViewModel),
        ChangeNotifierProvider<ArticalViewModel>.value(value: articalViewModel),
      ],

      child: Column(
        children: [
          Consumer<SourceViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (viewModel.errorMessage.isNotEmpty) {
                return _buildErrorMessage(context, viewModel.errorMessage);
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: viewModel.sources.length,
                        child: TabBar(
                          onTap: (index) {
                            articalViewModel.loadArticles(
                              viewModel.sources[index],
                            );
                          },
                          tabs: viewModel.sources
                              .map((e) => Tab(text: e.name!))
                              .toList(),
                          isScrollable: true,
                          indicatorColor: ColorsManager.white,
                          dividerColor: Colors.transparent,
                          labelColor: Theme.of(
                            context,
                          ).textTheme.titleLarge!.color,
                          labelStyle: Theme.of(context).textTheme.titleLarge,
                          unselectedLabelStyle: Theme.of(
                            context,
                          ).textTheme.titleMedium,
                          tabAlignment: TabAlignment.start,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),

          Consumer<ArticalViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (viewModel.errorMessage.isNotEmpty) {
                return _buildErrorMessage(context, viewModel.errorMessage);
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return ArticleItem(article: viewModel.articles[index]);
                    },
                    separatorBuilder: (_, _) {
                      return SizedBox(height: 16.h);
                    },
                    itemCount: viewModel.articles.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
