import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning/common/service/storage_service.dart';

import '../firebase_options.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    storageService = await StorageService().init();
  }
}
