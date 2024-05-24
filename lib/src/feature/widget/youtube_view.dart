import 'dart:html';
import 'dart:ui_web';
import 'package:flutter/material.dart';

Widget WidgetYouTubePlay(BuildContext context, String? urlYoutube) {
  platformViewRegistry.registerViewFactory(
    'youtube-player',
    (int viewId) => IFrameElement()
      ..width = '560'
      ..height = '315'
      ..src = urlYoutube!
      ..style.border = 'none'
      ..allowFullscreen = true,
  );

  return HtmlElementView(viewType: 'youtube-player');
}
