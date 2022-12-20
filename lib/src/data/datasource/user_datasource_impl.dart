import 'dart:convert';

import 'package:flutter_challenge/src/core/constants.dart';
import 'package:flutter_challenge/src/data/api/api_client.dart';
import 'package:flutter_challenge/src/data/datasource/user_datasource.dart';
import 'package:flutter_challenge/src/data/dto/user_dto.dart';
import 'package:flutter_challenge/src/domain/entity/user_entity.dart';

class UserDatasourceImpl extends UserDatasource {
  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      final response = await ApiClient.dio.get(Constants.USER_ENDPOINT);
      final Iterable userListJson = json.decode(response.data);
      return List<UserDTO>.from(
              userListJson.map((json) => UserDTO.fromJson(json)))
          .map((e) => e.toUserEntity())
          .toList();
    } on Exception catch (e) {
      rethrow;
    }
  }
}
