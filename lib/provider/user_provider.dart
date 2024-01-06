import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github/model/user.dart';
import 'package:github/util/api.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  User? user;
  // int ?followers;
  var client = http.Client();

  Future<void> getUserProfile(String username) async {
    final url = Uri.parse('${Api.api}/users/$username');
    print(url);

    try {
      final response = await client.get(
        url,
        headers: {'Authorization': 'token ${Api.token}'},
      );

      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print(responseData);
      // print(responseData['login']);

      user = User(
        username: responseData['login'],
        followers: responseData['followers'],
        following: responseData['following'],
        joined_date: responseData['created_at'],
        imageUrl: responseData[
            'avatar_url'], // Assuming 'avatar_url' is the correct field
        public_repo: responseData['public_repos'],
      );

      notifyListeners();
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  List<dynamic> followersList = [];
  Future<void> getFollowersList(String username) async {
    final url = Uri.parse('${Api.api}/users/$username/followers');

    try {
      final response = await client.get(
        url,
        headers: {'Authorization': 'token ${Api.token}'},
      );

      final List<dynamic> responseData = json.decode(response.body);
      followersList = responseData.map((data) => User.fromJson(data)).toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching followers list: $e");
    }
  }

  List<dynamic> followingList = [];
  Future<void> getFollowingList(String username) async {
    final url = Uri.parse('${Api.api}/users/$username/following');

    try {
      final response = await client.get(
        url,
        headers: {'Authorization': 'token ${Api.token}'},
      );

      final List<dynamic> responseData = json.decode(response.body);
      followingList = responseData.map((data) => User.fromJson(data)).toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching followers list: $e");
    }
  }
}
