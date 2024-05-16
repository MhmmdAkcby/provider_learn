import 'package:flutter/material.dart';
import 'package:provider_learn/reqres_resource/model/resource_model.dart';
import 'package:provider_learn/reqres_resource/service/resource_services.dart';

class FeedWidgetProvider extends ChangeNotifier {
  final IResourceService resourceService;
  List<Data> resource = [];
  bool isLoading = false;

  FeedWidgetProvider(this.resourceService) {
    _fetch();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resource = (await resourceService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }
}
