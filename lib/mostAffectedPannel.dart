import 'package:flutter/material.dart';

class MostAffectedPannel extends StatelessWidget {
  final List regionalData;

  const MostAffectedPannel({Key key, this.regionalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: RegionalBanner(regionalData: regionalData),
    );
  }
}

class RegionalBanner extends StatelessWidget {
  const RegionalBanner({
    Key key,
    @required this.regionalData,
  }) : super(key: key);

  final List regionalData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(
              regionalData[1]['countryInfo']['flag'].toString(),
              height: 50,
            ),
            Text(regionalData[1]['cases'].toString())
          ],
        ),
      ],
    );
  }
}
