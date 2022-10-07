import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HISTORY'),
          bottom: const TabBar(
            indicatorColor: Colors.lime,
            indicatorWeight: 1.0,
            labelColor: Colors.white,
            labelPadding: EdgeInsets.only(top: 10.0),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(Icons.credit_score_outlined),
                text: 'G.P.A Scores',
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              Tab(
                icon: Icon(Icons.calculate_outlined),
                text: 'C.G.P.A Scores',
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
                child: Text(
              'This is Android Image Tab',

              /// Index:0
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'This is Radio Tab',

              /// Index:1
              style: TextStyle(fontSize: 32),
            )),
          ],
        ),
      ),
    );
  }
}
