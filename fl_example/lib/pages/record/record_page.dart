// ignore_for_file: prefer_const_constructors, unused_field, avoid_print, unnecessary_brace_in_string_interps

import 'dart:typed_data';

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data' show Uint8List;

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Codec _codec = Codec.aacADTS;
const int tSAMPLERATE = 8000;

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => RecordPageState();
}

class RecordPageState extends State<RecordPage> {
  FlutterSoundRecorder recorderModule = FlutterSoundRecorder();
  FlutterSoundPlayer playerModule = FlutterSoundPlayer();
  StreamSubscription? _recorderSubscription;
  StreamSubscription? _playerSubscription;
  String filePath = "";
  String recordText = "00:00:00";
  String playerText = "00:00:00";
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("录制:${recordText}"),
            Text("播放:${playerText}"),
            SizedBox(height: 30),
            GestureDetector(
              child: Center(
                child: Text("录制"),
              ),
              onTap: () {
                print("录制");
                startRecorder();
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Center(
                child: Text("停止"),
              ),
              onTap: () {
                print("录制");
                stopRecorder();
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Center(
                child: Text("播放"),
              ),
              onTap: () {
                print("播放");
                startPlayer();
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Center(
                child: Text("停止"),
              ),
              onTap: () {
                print("停止");
                stopPlayer();
              },
            )
          ],
        )));
  }

  Future<void> init() async {
    await openTheRecorder();
    await _initializeExample();
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));
  }

  Future<void> _initializeExample() async {
    await playerModule.closePlayer();
    await playerModule.openPlayer();
    await playerModule.setSubscriptionDuration(Duration(milliseconds: 100));
    await recorderModule.setSubscriptionDuration(Duration(milliseconds: 100));
    await initializeDateFormatting();
  }

  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await recorderModule.openRecorder();
  }

  void startRecorder() async {
    try {
      // Request Microphone permission if needed
      if (!kIsWeb) {
        var status = await Permission.microphone.request();
        if (status != PermissionStatus.granted) {
          throw RecordingPermissionException(
              'Microphone permission not granted');
        }
      }
      var path = '';
      if (!kIsWeb) {
        var tempDir = await getTemporaryDirectory();
        path = '${tempDir.path}/flutter_sound${ext[_codec.index]}';
      } else {
        path = '_flutter_sound${ext[_codec.index]}';
      }
      filePath = path;
      await recorderModule.startRecorder(
        toFile: path,
        codec: _codec,
        bitRate: 8000,
        numChannels: 1,
        sampleRate: tSAMPLERATE,
      );
      recorderModule.logger.d('startRecorder');

      _recorderSubscription = recorderModule.onProgress!.listen((e) {
        var date = DateTime.fromMillisecondsSinceEpoch(
            e.duration.inMilliseconds,
            isUtc: true);
        var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
        setState(() {
          recordText = txt;
        });
        print("录制中=====================${txt} ${path}");
      });
    } on Exception catch (err) {
      recorderModule.logger.e('startRecorder error: $err');
      stopRecorder();
    }
  }

  void stopRecorder() async {
    try {
      await recorderModule.stopRecorder();
      recorderModule.logger.d('stopRecorder');
      cancelRecorderSubscriptions();
    } on Exception catch (err) {
      recorderModule.logger.d('stopRecorder error: $err');
    }
  }

  void cancelRecorderSubscriptions() {
    if (_recorderSubscription != null) {
      _recorderSubscription!.cancel();
      _recorderSubscription = null;
    }
  }

  void cancelPlayerSubscriptions() {
    if (_playerSubscription != null) {
      _playerSubscription!.cancel();
      _playerSubscription = null;
    }
  }

  Future<void> startPlayer() async {
    filePath =
        "https://flutter-sound.canardoux.xyz/web_example/assets/extract/06.mp4";

    // "https://res.miyachat.com/staging/upload/sign_voice/1692288000/64DF2E44/64DF39FD162E44/1692350973433181453636_0.mp4"
    if (filePath.isEmpty) {
      return;
    }
    try {
      print("voice开始播放 ${filePath}");
      await playerModule.startPlayer(
          fromURI: filePath,
          codec: _codec,
          sampleRate: tSAMPLERATE,
          whenFinished: () {
            print("voice播放结束");
          });
      _addListeners();
    } catch (e) {
      print("voice播放异常${e}");
    }
  }

  void _addListeners() {
    cancelPlayerSubscriptions();
    _playerSubscription = playerModule.onProgress!.listen((e) {
      var date = DateTime.fromMillisecondsSinceEpoch(e.position.inMilliseconds,
          isUtc: true);
      var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
      print("voice========${txt}");
      setState(() {
        playerText = txt;
      });
    });
  }

  Future<void> stopPlayer() async {
    try {
      await playerModule.stopPlayer();
      playerModule.logger.d('stopPlayer');
      if (_playerSubscription != null) {
        await _playerSubscription!.cancel();
        _playerSubscription = null;
      }
    } on Exception catch (err) {
      playerModule.logger.d('error: $err');
    }
    setState(() {});
  }
}
