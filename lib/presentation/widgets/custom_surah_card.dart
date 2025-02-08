import 'package:flutter/material.dart';
import 'package:flutter_46home/data/model/surah_model.dart';
import 'package:flutter_46home/presentation/screens/audio_players_screen.dart';
import 'package:flutter_46home/provider/quran_provider.dart';
import 'package:provider/provider.dart';

class CustomSurahCard extends StatelessWidget {
  const CustomSurahCard({super.key, required this.surah});
  final SurahModelData surah;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(surah.name),
        subtitle: Text(surah.englishName),
        leading: Icon(Icons.book),
        trailing: Icon(Icons.play_arrow),
        onTap: () async {
          await context.read<QuranProvider>().getAudio(number: surah.number);

          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AudioPlayersScreen(
                    number: surah.number, surahName: surah.englishName),
              ));
        },
      ),
    );
  }
}
