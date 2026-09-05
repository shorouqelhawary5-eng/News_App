import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/feature/views/sources_view/article_item.dart';
import 'package:news_app/provider/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  context.read<SearchViewModel>().searchArticles(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      context.read<SearchViewModel>().searchArticles('');
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Consumer<SearchViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (viewModel.errorMessage != null) {
                      return Center(
                        child: Text(
                          viewModel.errorMessage!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    if (viewModel.articles.isEmpty) {
                      return const Center(
                        child: Text(
                          'No articles found',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: viewModel.articles.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        return ArticleItem(article: viewModel.articles[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
// import 'package:news_app/provider/search_view_model.dart';
// import 'package:provider/provider.dart';
// import 'package:news_app/feature/views/sources_view/article_item.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(16.r),
//           child: Column(
//             children: [
//               // 1. حقل الإدخال (لا يعاد بناؤه مع كل استجابة لـ ViewModel)
//               TextField(
//                 controller: _searchController,
//                 onChanged: (value) {
//                   // إرسال النص المكتوب للـ ViewModel
//                   context.read<SearchViewModel>().searchArticles(value);
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: const Icon(Icons.search),
//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.clear),
//                     onPressed: () {
//                       _searchController.clear();
//                       context.read<SearchViewModel>().searchArticles('');
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.h),

//               // 2. الجزء الخاص بعرض النتائج فقط يتم إعادت بناؤه عبر Consumer
//               Expanded(
//                 child: Consumer<SearchViewModel>(
//                   builder: (context, viewModel, child) {
//                     if (viewModel.isLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                     if (viewModel.errorMessage != null) {
//                       return Center(child: Text(viewModel.errorMessage!));
//                     }
//                     if (_searchController.text.trim().isEmpty) {
//                       return const Center(
//                         child: Text('Type something to search...'),
//                       );
//                     }
//                     if (viewModel.articles.isEmpty) {
//                       return const Center(child: Text('No articles found'));
//                     }
//                     return ListView.separated(
//                       itemCount: viewModel.articles.length,
//                       separatorBuilder: (context, index) =>
//                           SizedBox(height: 12.h),
//                       itemBuilder: (context, index) {
//                         return ArticleItem(article: viewModel.articles[index]);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
