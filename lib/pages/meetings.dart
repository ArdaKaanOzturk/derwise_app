import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class MeetingsPage extends StatefulWidget {
  @override
  _MeetingsPageState createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 3 sekme için bir TabController oluşturuluyor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        backgroundColor: DerwiseTheme.backgroundApp,
        title: Text('Meetings'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: DerwiseTheme.colorBlue,
          labelColor: DerwiseTheme.colorBlue, // selected label color
          tabs: [
            Tab(text: 'History'),
            Tab(text: 'Connections')
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Sekme içerikleri buraya gelecek
          Center(child: Text('History Content')),
          Center(child: Text('Connections Content'))
        ],
      ),
    );
  }
}
