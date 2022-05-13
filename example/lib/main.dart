import 'package:flutter/material.dart';
import 'package:file_viewer/file_viewer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('File Viewer')),
        body: const LocalFileViewer(filePath: 'assets/local_file.docx', whileLoading: Text('loading'))
      ),
    );
  }
}
