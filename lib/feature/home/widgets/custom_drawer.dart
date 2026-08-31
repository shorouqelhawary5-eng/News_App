import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: ColorsManager.white,
            height: 166.h,
            alignment: Alignment.center,
            child: Text(
              localization.newsApp,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: ColorsManager.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: REdgeInsets.all(16.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(IconAssetsManager.icHome),
                    SizedBox(width: 8.w),
                    Text(
                      localization.goToHome,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
                Divider(),
                SizedBox(height: 24.h),

                Row(
                  children: [
                    Image.asset(IconAssetsManager.theme),
                    SizedBox(width: 8.w),
                    Text(
                      localization.theme,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                DropdownButtonFormField<String>(
                  value: localization.dark,
                  dropdownColor: const Color(0xFF171717),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: ColorsManager.white,
                  ),
                  style: const TextStyle(
                    color: ColorsManager.white,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: ColorsManager.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: localization.dark,
                      child: Text(localization.dark),
                    ),
                    DropdownMenuItem(
                      value: localization.light,
                      child: Text(localization.light),
                    ),
                  ],
                  onChanged: (value) {},
                ),

                SizedBox(height: 24.h),
                Divider(),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Image.asset(IconAssetsManager.language),
                    SizedBox(width: 8.w),
                    Text(
                      localization.language,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                DropdownButtonFormField<String>(
                  value: localization.english,
                  dropdownColor: const Color(0xFF171717),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: ColorsManager.white,
                  ),
                  style: const TextStyle(
                    color: ColorsManager.white,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: ColorsManager.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: localization.english,
                      child: Text(localization.english),
                    ),
                    DropdownMenuItem(
                      value: localization.arabic,
                      child: Text(localization.arabic),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
