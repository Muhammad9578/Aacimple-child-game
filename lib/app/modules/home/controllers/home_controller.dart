import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:aacimple/app/Utils/main_db_helper.dart';
import 'package:aacimple/app/Utils/old_db_helper.dart';
import 'package:aacimple/app/Utils/strings.dart';
import 'package:aacimple/app/modules/home/views/newmessage/messages_list.dart';
import 'package:aacimple/main.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> allPhrases = [];
  final box = GetStorage();

  RxInt selectedIndex = 0.obs;
  MainDatabaseHelper mainDbHelper = MainDatabaseHelper();
  OldDatabaseHelper oldDbHelper = OldDatabaseHelper();

  // Controller for text input fields
  TextEditingController keyfieldController = TextEditingController();
  TextEditingController phraseController = TextEditingController();

     late FlutterTts tts;


  /////
  // late FlutterSoundRecorder recordingSession;

  double volume = 1; // Range: 0-1

  double pitch = 0.7;
  String languageCode = 'en-US';

  ///
  Map<String, dynamic> selectedDbItem = {};

  late AudioPlayer audioPlayer;
  RxBool isPlaying = false.obs;
  RxBool isRecording = false.obs;
  RxString timerText = '00:00:00'.obs;
  //Settings
  RxDouble presentationDuration = 3.0.obs;
  RxBool pictureOnMessageBox = false.obs;
  RxBool textOnCenterOfMessageBox = false.obs;
  RxBool randomizeMessageBoxses = false.obs;
  RxBool listenAudiofromMessageBox = true.obs;
  Rx<Color> messageBoxBackgroundColor = const Color(0xff00008B).obs;
  Rx<Color> messageBoxFontColor = Colors.white.obs;
  RxDouble messageBoxFontSize = 12.0.obs;
  RxString messageBoxFont = 'Tahoma'.obs;

  // Default values for switches
  RxBool pictureSwitch = true.obs;
  RxBool textSwitch = true.obs;
  RxBool soundSwitch = true.obs;
  RxString phraseImage = "".obs;
  String phraseAudio = '';
  // Default values for dropdowns
  RxString selectedLanguage = 'English'.obs;
  RxDouble selectedFontSize = 12.0.obs;

  // Default values for color pickers

  Rx<Color> selectedBackgroundColor = const Color(0xff00008B).obs;
  Rx<Color> selectedFontColor = Colors.white.obs;

  insertPhrase(bool forMainDb) async {
    Map<String, dynamic> row = {
      'keyField': '001',
      'language': selectedLanguage.value,
      'phrase': phraseController.text,
      'picturePath': phraseImage.value,
      'soundPath': phraseAudio,
      'isPictureVisible':
          pictureSwitch.isTrue ? 1 : 0, // 1 for true, 0 for false
      'isTextVisible': textSwitch.isTrue ? 1 : 0,
      'isSoundEnabled': soundSwitch.isTrue ? 1 : 0,
      'fontSize': selectedFontSize.value,
      'fontColor':
          '0x${selectedFontColor.value.value.toRadixString(16).padLeft(8, '0')}',
      'bgColor':
          '0x${selectedBackgroundColor.value.value.toRadixString(16).padLeft(8, '0')}',
    };
    if (forMainDb) {
      int id = await mainDbHelper.insertPhrase(row);
      log('Inserted phrase with id: $id');
      // DefaultSnackbar.show('Success', 'Record Added!');
      // List allPhrases = await mainDbHelper.getAllPhrases();
      // log(allPhrases.toString());
      // int idd = await oldDbHelper.insertPhrase(row);
      // log('Inserted phrase with id: $id');
      // List alllPhrases = await oldDbHelper.getAllPhrases();
      // log(alllPhrases.toString());
    } else {
      int id = await oldDbHelper.insertPhrase(row);
      log('Inserted phrase with id: $id');
      // List allPhrases = await oldDbHelper.getAllPhrases();
      // log(allPhrases.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getAllPhrases(bool fromMainDb) async {
    if (fromMainDb) {
      return await mainDbHelper.getAllPhrases();
    } else {
      return await oldDbHelper.getAllPhrases();
    }
  }

  Future updateSamplePhrase(bool fromMainDb) async {
    Map<String, dynamic> updatedRow = {
      'id':
          selectedDbItem[Strings.id], // Specify the ID of the record to update
      'keyField': '001',
      'language': selectedLanguage.value,
      'phrase': phraseController.text,
      'picturePath': phraseImage.value,
      'soundPath': phraseAudio,
      'isPictureVisible':
          pictureSwitch.isTrue ? 1 : 0, // 1 for true, 0 for false
      'isTextVisible': textSwitch.isTrue ? 1 : 0,
      'isSoundEnabled': soundSwitch.isTrue ? 1 : 0,
      'fontSize': selectedFontSize.value,
      'fontColor':
          '0x${selectedFontColor.value.value.toRadixString(16).padLeft(8, '0')}',
      'bgColor':
          '0x${selectedBackgroundColor.value.value.toRadixString(16).padLeft(8, '0')}',
    };
    if (fromMainDb) {
      int rowsUpdated = await mainDbHelper.updatePhrase(updatedRow);
      print('Updated $rowsUpdated rows');
    } else {
      int rowsUpdated = await oldDbHelper.updatePhrase(updatedRow);
      print('Updated $rowsUpdated rows');
    }
  }

  void deleteSamplePhrase(bool fromMainDb, int id) async {
    int idToDelete = id; // Specify the ID of the record to delete
    if (fromMainDb) {
      int rowsDeleted = await mainDbHelper.deletePhrase(idToDelete);
      print('Deleted $rowsDeleted rows');
    } else {
      int rowsDeleted = await oldDbHelper.deletePhrase(idToDelete);
      print('Deleted $rowsDeleted rows');
    }
  }

  void initializer() async {
    // audioPlayer = AudioPlayer();
    // audioPlayer.onPlayerComplete.listen((event) {
    //   isPlaying.value = false;
    // });

    // recordingSession = FlutterSoundRecorder();
    // recordingSession.openRecorder();
    // // await _recordingSession
    // //     .setSubscriptionDuration(const Duration(milliseconds: 10));
    // await initializeDateFormatting();
    // await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.photos.request();
  }

  // Future<void> startRecording() async {
  //   String appDocPath = appDocDir!.path;
  //   phraseAudio = '$appDocPath/${DateTime.now().millisecondsSinceEpoch}.wav';
  //   Directory directory = Directory(path.dirname(phraseAudio));
  //   if (!directory.existsSync()) {
  //     directory.createSync();
  //   }
  //   await recordingSession.openRecorder();
  //   await recordingSession.startRecorder(
  //     toFile: phraseAudio,
  //     // codec: Codec.pcm16WAV,
  //   );
  //   isRecording.value = true;
  //   StreamSubscription recorderSubscription =
  //       recordingSession.onProgress!.listen((e) {
  //     var date = DateTime.fromMillisecondsSinceEpoch(e.duration.inMilliseconds,
  //         isUtc: true);
  //     var timeText = DateFormat('mm:ss:SS', 'en_GB').format(date);
  //     timerText.value = timeText.substring(0, 8);
  //   });
  //   recorderSubscription.cancel();
  // }
  // Future stopRecording() async {
  //   isRecording.value = false;
  //   await recordingSession.stopRecorder();
  //   recordingSession.closeRecorder();
  // }
  // Future<void> playPause(String url) async {
  //   audioPlayer = AudioPlayer();
  //   audioPlayer.onPlayerComplete.listen((event) {
  //     isPlaying.value = false;
  //   });
  //   if (isPlaying.isTrue) {
  //     audioPlayer.stop();
  //   } else {
  //     await audioPlayer.play(UrlSource(url));
  //   }

  //   isPlaying.value = !isPlaying.value;
  // }

  void speak(String text) {
    tts.setVolume(volume);
    // if (languageCode != null) {
    //   tts.setLanguage(languageCode!);
    // }
    
    tts.setPitch(pitch);
    tts.speak(text);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    tts = FlutterTts();
    await tts.setVoice({"name": "el-GR-language", "locale": "el-GR"});
  // List voices= await tts.getVoices;
  // log(voices.toString());
    log("enter");
    // mainDbHelper.initDatabase();
   bool isAdded= box.read('isAdded')??false;
   log("isAdded${isAdded}");
  if(isAdded==false) {
    addPhrases();
     box.write('isAdded', true);
   }
   
  }

  addPhrases(){
    for(var data in phrasesList){
      selectedLanguage.value='Greek';
      phraseController.text=data["WORDINGREEK"];
      phraseImage.value=data["FILENAME"];
      phraseAudio=data["FILENAME"].toString().replaceAll("png", "mp3");
      pictureSwitch.value=true;
      textSwitch.value=true;
      soundSwitch.value=true;
      insertPhrase(true);
    }
  }


}
