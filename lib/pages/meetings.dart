import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class MeetingsPage extends StatefulWidget {
  @override
  _MeetingsPageState createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // TabController for 3 tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        backgroundColor: DerwiseTheme.backgroundApp,
        title: const Text(
          'Meetings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: DerwiseTheme.colorBlue,
          labelColor: DerwiseTheme.colorBlue, // selected label color
          tabs: const [Tab(text: 'History'), Tab(text: 'Connections')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Tab contents
          Center(child: Text('History Content')),
          Center(child: Text('Connections Content'))
        ],
      ),
    );
  }
}
