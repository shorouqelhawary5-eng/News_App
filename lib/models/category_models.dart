import 'package:news_app/core/resources/assets_manager.dart';

class CategoryModels {
  final String? id;
  final String? title;
  final String? image;

  CategoryModels({this.id, this.title, this.image});

  static List<CategoryModels> categories = [
    CategoryModels(
      id: '0',
      title: 'General',
      image: ImageAssetsManager.general,
    ),
    CategoryModels(
      id: '1',
      title: 'Business',
      image: ImageAssetsManager.business,
    ),
    CategoryModels(
      id: '2',
      title: 'Technology',
      image: ImageAssetsManager.technology,
    ),
    CategoryModels(
      id: '3',
      title: 'Entertainment',
      image: ImageAssetsManager.entertainment,
    ),
    CategoryModels(id: '4', title: 'Sports', image: ImageAssetsManager.sports),
    CategoryModels(
      id: '5',
      title: 'Science',
      image: ImageAssetsManager.science,
    ),
    CategoryModels(id: '6', title: 'Health', image: ImageAssetsManager.health),
  ];
}
