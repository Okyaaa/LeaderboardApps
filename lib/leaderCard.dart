import 'package:flutter/material.dart';
import 'package:tutorialapps/style_constant.dart';

class LeaderCard extends StatefulWidget {
  String ranking;
  String gameName;
  String rating;

  LeaderCard(
      {this.ranking, 
      this.gameName, 
      this.rating});

  @override
  _LeaderCardState createState() => _LeaderCardState();
}

class _LeaderCardState extends State<LeaderCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
          width: size.width,
          padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.15),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/jett.jpg'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.gameName??'default value',
                            style: leaderboad1,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            widget.rating + " Rr",
                            style: leaderboard3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "# " + widget.ranking,
                    style: leaderboad1,
                  ),
                ])
          ])),
    );
  }
}
