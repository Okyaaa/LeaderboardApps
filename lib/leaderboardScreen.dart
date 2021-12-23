import 'package:flutter/material.dart';
import 'package:tutorialapps/api_service.dart';
import 'package:tutorialapps/leaderCard.dart';
import 'package:tutorialapps/leaderboardModel.dart';
import 'package:tutorialapps/style_constant.dart';

class Leaderboard extends StatefulWidget {
  Leaderboard({Key key}) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  // Future<LeaderboardModel> _leaderboard = APIservice().getDataLeaderboard();
  Future<LeaderboardModel> _leaderboard = APIservice().getDataLeaderboard();

  @override
  void initState() {
    _leaderboard = APIservice().getDataLeaderboard();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Leaderboard",
                    style: leaderboard2,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                FutureBuilder<LeaderboardModel>(
                    future: _leaderboard,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            controller: ScrollController(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var numRanking = index + 1;
                              var _ranking = snapshot.data.players[index];
                              return LeaderCard(
                                  ranking: numRanking.toString(),
                                  gameName: _ranking.gameName,
                                  rating: _ranking.rankedRating.toString());
                            },
                            separatorBuilder: (BuildContext context, index) =>
                                const Divider(
                                  height: 2,
                                ),
                            itemCount: 50);
                      } else {
                          return SizedBox();
                      }
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}