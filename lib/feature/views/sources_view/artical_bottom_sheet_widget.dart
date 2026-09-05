import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/data/apis/artical_response/article.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticalBottomSheetWidget extends StatelessWidget {
  final Article article;
  const ArticalBottomSheetWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: theme.themeMode == ThemeMode.light
            ? ColorsManager.black
            : ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        spacing: 8.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.broken_image)),
            ),
          ),
          Text(
            article.description ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ElevatedButton(
            onPressed: () async {
              final Uri uri = Uri.parse(article.url ?? "");
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
            child: Text("View full article"),
          ),
        ],
      ),
    );
  }
}
