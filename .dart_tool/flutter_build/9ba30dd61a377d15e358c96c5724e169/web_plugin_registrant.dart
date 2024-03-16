// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:pointer_interceptor_web/pointer_interceptor_web.dart';
import 'package:video_player_web/video_player_web.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  FilePickerWeb.registerWith(registrar);
  UnityWidgetController.registerWith(registrar);
  PointerInterceptorWeb.registerWith(registrar);
  VideoPlayerPlugin.registerWith(registrar);
  WebWebViewPlatform.registerWith(registrar);
  registrar.registerMessageHandler();
}