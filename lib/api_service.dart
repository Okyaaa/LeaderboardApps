import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutorialapps/leaderboardModel.dart';

class APIservice{
  Future<LeaderboardModel> getDataLeaderboard() async {
    var leaderboard;

    try {
      final response = await http.get(Uri.parse(
          "https://ap.api.riotgames.com/val/ranked/v1/leaderboards/by-act/a16955a5-4ad0-f761-5e9e-389df1c892fb?size=50&startIndex=0&api_key=RGAPI-7bd058b9-ff8e-4e57-ba3b-d59a09a1139f"));
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        final jsonString = response.body;
        final jsonMap = json.decode(jsonString);
        // print(jsonMap);
        leaderboard = LeaderboardModel.fromJson(jsonMap);
      } else {}
    } catch (e) {
      print(e.toString());
    }

    print(leaderboard);
    return leaderboard;
  }
}