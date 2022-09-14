import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_share_plugin/social_share_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('social_share_plugin_x');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      print(methodCall.arguments['path']);
      return <String, dynamic>{
        'caption': 'caption',
        'path': 'path',
      };
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
  await SocialSharePlugin.shareToFeedFacebook(path: 'path');
  });
}
