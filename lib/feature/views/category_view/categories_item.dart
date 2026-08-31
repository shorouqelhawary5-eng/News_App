import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/models/category_models.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.index});
  final int index;
  final List<CategoryModels> categories = CategoryModels.categories;
  bool isCategory = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Container(
        height: 198.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.sp),
          border: Border.all(color: const Color.fromARGB(255, 107, 102, 102)),
        ),
        child: Image.asset(categories[index].image!, fit: BoxFit.cover),
      ),
    );
  }

  void _onTap() {
    isCategory = false;
  }
}
