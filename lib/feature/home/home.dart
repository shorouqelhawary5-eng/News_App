import 'package:flutter/material.dart';
import 'package:news_app/feature/home/widgets/custom_drawer.dart';

import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Consumer<HomeScreenProvider>(
          builder: (context, provider, _) {
            return Text(provider.selectedCategory ?? localization.home);
          },
        ),
        actions: [Icon(Icons.search)],
        centerTitle: true,
      ),
      drawer: CustomDrawer(),

      body: Provider.of<HomeScreenProvider>(context).view,
    );
  }
}
