import 'package:flutter/material.dart';
import 'package:provider_learn/reqres_resource/product/widget/feed_widget/feed_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FeedWidget(),
          )
        ],
      ),
    );
  }
}
