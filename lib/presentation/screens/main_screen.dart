import 'package:flutter/material.dart';
import 'package:flutter_46home/presentation/widgets/custom_surah_card.dart';
import 'package:flutter_46home/presentation/widgets/search_delegate.dart';
import 'package:flutter_46home/provider/quran_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Quran App",
          style: TextStyle(fontSize: 12.sp, color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade400,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ApiSearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade900]),
            ),
          ),
          Consumer<QuranProvider>(
            builder: (context, provider, child) {
              if (provider.isloading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.surahs.isEmpty) {
                return Center(
                  child: Text("No Data Avialble"),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final surah = provider.surahs[index];
                  return Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomSurahCard(surah: surah));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
