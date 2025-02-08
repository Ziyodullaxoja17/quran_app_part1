import 'package:flutter/material.dart';
import 'package:flutter_46home/provider/quran_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class AudioPlayersScreen extends StatefulWidget {
  const AudioPlayersScreen({
    super.key,
    required this.number,
    required this.surahName,
  });

  final int number;
  final String surahName;

  @override
  State<AudioPlayersScreen> createState() => _AudioPlayersScreenState();
}

class _AudioPlayersScreenState extends State<AudioPlayersScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      // Get list of Ayah audio URLs from provider
      final quranProvider = context.read<QuranProvider>();

      if (quranProvider.ayahsAudios != null &&
          quranProvider.ayahsAudios!.isNotEmpty) {
        final playlist = ConcatenatingAudioSource(
            children: quranProvider.ayahsAudios!.toList(),
            useLazyPreparation: true,
            shuffleOrder: DefaultShuffleOrder());

        // Set playlist to the audio player
        await _audioPlayer.setAudioSource(playlist);
      }
    } catch (e) {
      debugPrint("Error initializing audio: $e");
    }
  }

  Future<void> _togglePlayPause() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }

    setState(() {
      isPlaying = _audioPlayer.playing;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.blue,
        title: Text(
          widget.surahName,
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _togglePlayPause,
          child: Text(isPlaying ? "Pause Audio" : "Play Audio"),
        ),
      ),
    );
  }
}
