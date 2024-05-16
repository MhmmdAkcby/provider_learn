import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_learn/reqres_resource/model/resource_model.dart';

abstract class IResourceService {
  IResourceService(this.dio);
  final Dio dio;

  Future<ResourceModel?> fetchResourceItem();
}

enum _ResourcePath { resource }

class ResourceService extends IResourceService {
  ResourceService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    try {
      final response = await dio.get('/${_ResourcePath.resource.name}');

      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return ResourceModel.fromJson(jsonBody);
        }
      }
    } on DioException catch (exception) {
      _DebugShow()._showException(exception, this);
    }
    return null;
  }
}

class _DebugShow {
  void _showException<T>(DioException exception, T type) {
    if (kDebugMode) {
      print(exception.message);
      print(type);
      print('--------------------------------');
    }
  }
}
