import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_viewer/file_viewer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _filePath;

  @override
  initState() {
    _loadTestFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('File Viewer')),
        body: _filePath == null 
          ? _whileLoading()
          : LocalFileViewer(filePath: _filePath!, whileLoading: _whileLoading())
      ),
    );
  }

  Widget _whileLoading() => const Center(child: CircularProgressIndicator());

  void _loadTestFile() async {
    const assetType = 'docx';
    const assetPath = 'assets/local_file.docx';

    final _directory = await getTemporaryDirectory();
    String filePath = "${_directory.path}/fileview/${base64.encode(utf8.encode(assetPath))}.$assetType";

    if (!await _convertAssetToLocalFile(filePath, assetPath, assetType)) { return; }
    setState(() { _filePath = filePath; });
  }

  Future _convertAssetToLocalFile(String filePath, String assetPath, String fileType) async {
    File file = File(filePath);
    if (File(filePath).existsSync()) { await file.delete(); }

    await file.create(recursive: true);
    ByteData bd = await rootBundle.load(assetPath);

    await file.writeAsBytes(bd.buffer.asUint8List(), flush: true);
    return true;
  }
}
