import 'package:flutter/material.dart';
import 'package:news_app/feature/home/widgets/custom_drawer.dart';
import 'package:news_app/feature/views/category_view/category_view.dart';
import 'package:news_app/feature/views/sources_view/sources_view.dart';
import 'package:news_app/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget view = CategoryView(categoryClick: categoryClick);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.home),
        actions: [Icon(Icons.search)],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: CustomDrawer(onTap: goToCategories),

      body: view,
    );
  }

  void categoryClick() {
    setState(() {
      view = SourcesView();
    });
  }

  void goToCategories() {
    setState(() {
      view = CategoryView(categoryClick: categoryClick);
    });
    Navigator.pop(context);
  }
}
