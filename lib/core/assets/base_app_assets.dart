import 'package:flutter/material.dart';

abstract class BaseAppAssets {
  static String get logoNotes => 'note_icon.svg'.baseAppSvgIcons;
}

extension BaseAppAssetsStringExtension on String {
  AssetImage get baseAppIcons {
    return AssetImage('assets/icons/$this');
  }

  String get baseAppSvgIcons {
    return 'assets/icons/svg/$this';
  }
}
