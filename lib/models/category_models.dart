import 'package:news_app/core/resources/assets_manager.dart';

class CategoryModels {
  final String? id;
  final String? title;
  final String? image;

  CategoryModels({this.id, this.title, this.image});

  static List<CategoryModels> categories = [
    CategoryModels(
      id: 'general',
      title: 'General',
      image: ImageAssetsManager.general,
    ),
    CategoryModels(
      id: 'business',
      title: 'Business',
      image: ImageAssetsManager.business,
    ),
    CategoryModels(
      id: 'technology',
      title: 'Technology',
      image: ImageAssetsManager.technology,
    ),
    CategoryModels(
      id: 'entertainment',
      title: 'Entertainment',
      image: ImageAssetsManager.entertainment,
    ),
    CategoryModels(
      id: 'sports',
      title: 'Sports',
      image: ImageAssetsManager.sports,
    ),
    CategoryModels(
      id: 'science',
      title: 'Science',
      image: ImageAssetsManager.science,
    ),
    CategoryModels(
      id: 'health',
      title: 'Health',
      image: ImageAssetsManager.health,
    ),
  ];
}
