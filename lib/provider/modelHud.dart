// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Modelhud extends ChangeNotifier {
  bool isloading = false;
  changeisLoading(bool value) {
    isloading = value;
    notifyListeners();
  }
}
