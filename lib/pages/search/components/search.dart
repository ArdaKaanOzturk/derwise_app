import 'package:derwise_app/pages/search/components/searchcards.dart';
import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DerwiseTheme.backgroundApp,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: DerwiseTheme.backgroundApp,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 177, 177, 177)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 140, 141, 141),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            Column(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SearchCards(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
