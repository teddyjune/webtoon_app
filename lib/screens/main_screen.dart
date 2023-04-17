import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/services/api_service.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    //print(webtoon);
    //print(isLoading);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        elevation: 2,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              //print(index);
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final webtoon = snapshot.data[index];
                return Text(webtoon.title);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 20),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
