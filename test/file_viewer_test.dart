import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:file_viewer/file_viewer.dart';

void main() {
  const MethodChannel channel = MethodChannel('file_viewer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FileViewer.platformVersion, '42');
  });
}
