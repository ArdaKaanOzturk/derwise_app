import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<String> subtexts = [
    'Here the process that update stock_move records to set sale_line_id using the _prepare_procurement_values method: in addons/mrp/models/stock_move.py',
    'You can try using conda installations in kaggle. Example:  ',
    'I found the problem after downloading the Gammu source code... is acctually very simple, these lines: ',
    'You can do it like this (if good or not is a matter of opinion): Create your own converter for `Numbers that suppresses conversion issues and then replace the default one with yours.',
    'So you generate a view capable of showing all structs and their properties recursively. And you have implemented TextBox controls for editing property values.',
    'But when updating the nested struct properties, the changes in the TextBoxes do not propagate back to the struct.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',
            style: GoogleFonts.roboto(fontSize: 25, color: Colors.white)),
        backgroundColor: DerwiseTheme.backgroundApp,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [DerwiseTheme.backgroundApp, DerwiseTheme.backgroundApp],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                bottom: 16,
                left: index.isEven ? 0 : 32,
                right: index.isOdd ? 0 : 32,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: DerwiseTheme.bottomBarSecondary,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('You have a new notification',
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(
                    subtexts[index],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text('12:52 PM',
                      style:
                          GoogleFonts.lato(fontSize: 16, color: Colors.white)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
