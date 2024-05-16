import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/reqres_resource/model/resource_model.dart';
import 'package:provider_learn/reqres_resource/product/color/project_colors.dart';
import 'package:provider_learn/reqres_resource/product/extension/string_extension.dart';
import 'package:provider_learn/reqres_resource/product/language/language_item.dart';
import 'package:provider_learn/reqres_resource/product/service/project_dio.dart';
import 'package:provider_learn/reqres_resource/product/widget/icon_button/icon_button_widget.dart';
import 'package:provider_learn/reqres_resource/service/resource_services.dart';
import 'package:provider_learn/reqres_resource/view_model/feed_widget_provider/feed_widget_provider.dart';

part 'part_of_appbar.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FeedWidgetProvider>(
      create: (context) => FeedWidgetProvider(ResourceService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: const _PartOfAppBar(),
          body: Selector<FeedWidgetProvider, bool>(
            builder: (context, value, child) {
              return value ? const Placeholder() : _resourceView(context, context.watch<FeedWidgetProvider>().resource);
            },
            selector: (context, provider) {
              return provider.isLoading;
            },
          ),
        );
      },
    );
  }

  GridView _resourceView(BuildContext context, List<Data> item) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      scrollDirection: Axis.vertical,
      itemCount: item.length,
      itemBuilder: (context, index) {
        return _ColorCard(model: item[index]);
      },
    );
  }
}

class _ColorCard extends StatelessWidget {
  const _ColorCard({
    super.key,
    required Data? model,
  }) : _model = model;

  final Data? _model;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(_model?.color.colorValue ?? 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _colorListTile(),
        ],
      ),
    );
  }

  ListTile _colorListTile() {
    return ListTile(
      title: Text(_model?.name?.toUpperCase() ?? '', style: const TextStyle(color: ProjectColors.whiteColor)),
      subtitle: Text("Hex: ${_model?.color ?? ''}", style: const TextStyle(color: ProjectColors.whiteColor)),
    );
  }
}
