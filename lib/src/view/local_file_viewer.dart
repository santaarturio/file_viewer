import 'dart:io';

import 'package:file_viewer/file_viewer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LocalFileViewer extends StatefulWidget {

  /// Path to the local file
  final String filePath;

  /// Widget that should be presented while file is loading
  final Widget? whileLoading;

  const LocalFileViewer({
    Key? key,
    required this.filePath,
    this.whileLoading,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocalFileViewerState();
}

class _LocalFileViewerState extends State<LocalFileViewer> {

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ? _createIosView()
      : _createAndroidView();
  }

  Widget _createIosView() {
    return UiKitView(
      viewType: view_name,
      creationParams: <String, String>{ 'filePath': widget.filePath },
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  Widget _createAndroidView() {
    return const Text('Android View');
  }
}