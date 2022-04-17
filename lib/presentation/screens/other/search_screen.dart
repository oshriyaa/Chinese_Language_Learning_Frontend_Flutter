import 'dart:convert';
import 'package:chinese_learning/models/search_vocabulary_model.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_vocabulary/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../colors/colors.dart';
import '../../styling/textstyle.dart';
import '../dashboard/landing_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<SearchVocabulary> _list = [];
  final List<SearchVocabulary> _search = [];
  var loading = false;

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response =
        await http.get(Uri.parse("http://10.0.2.2:8000/vocabulary"));
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        for (Map i in data) {
          _list.add(SearchVocabulary.formJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((index) {
      if (index.inEnglish.toString().toLowerCase().contains(text.toString().toLowerCase()))
        // || f.inPinYin.toString().toLowerCase().contains(text))
        _search.add(index);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Search", style: StyleText.textAppBar),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingScreen(),
                ),
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: CustomColors.RED,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: _search.isNotEmpty || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, i) {
                              final searchList = _search[i];
                              return WordWidget(
                                inEng: searchList.inEnglish,
                                inNep: searchList.inNepali,
                                inChi: searchList.inChinese,
                                inPin: searchList.inPinYin,
                                inDev: searchList.inDevnagari,
                                isFav: true,
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final displayList = _list[i];
                              return Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      WordWidget(
                                        inEng: displayList.inEnglish,
                                        inNep: displayList.inNepali,
                                        inChi: displayList.inChinese,
                                        inPin: displayList.inPinYin,
                                        inDev: displayList.inDevnagari,
                                        audio: displayList.audio,
                                        isFav: true,
                                      ),
                                    ],
                                  ));
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
