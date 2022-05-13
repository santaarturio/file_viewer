import 'dart:async';
import 'package:file_viewer/file_viewer.dart';
import 'package:flutter/services.dart';

class FileViewer {
  static const MethodChannel _channel = MethodChannel(channelName);

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool?> getLoadingState() async {
    return await _channel.invokeMethod<bool>('getLoadingState');
  }
}
