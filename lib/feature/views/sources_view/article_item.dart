import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      height: 322.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        border: Border.all(color: ColorsManager.white),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.sp),
            child: Image.asset(
              "assets/images/test.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 220.h,
            ),
          ),

          SizedBox(height: 10.h),
          Text(
            article.description!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                article.author!,
                style: Theme.of(context).textTheme.labelSmall,
              ),

              Text(
                article.publishedAt!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
