import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/feature/views/category_view/categories_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/models/category_models.dart';
import 'package:news_app/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            localizations.goodMorning,
            style: Theme.of(context).textTheme.headlineLarge,
          ),

          SizedBox(height: 16.h),

          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: CategoryItem(index: index),
                  onTap: () {
                    Provider.of<HomeScreenProvider>(
                      context,
                      listen: false,
                    ).goToSources(CategoryModels.categories[index]);
                  },
                );
              },

              separatorBuilder: (_, _) {
                return SizedBox(height: 16.h);
              },
              itemCount: CategoryModels.categories.length,
              shrinkWrap: true,
            ),
          ),

          // CategoryItem(index: 0),
        ],
      ),
    );
  }
}
