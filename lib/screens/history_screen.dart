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
                text: 'G.P.A Scores',
              ),
              Tab(
                text: 'C.G.P.A Scores',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: []),
      ),
    );
  }
}
