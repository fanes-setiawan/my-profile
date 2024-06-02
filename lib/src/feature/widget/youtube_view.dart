import 'dart:html';
import 'dart:ui_web';
import 'package:flutter/material.dart';

Widget WidgetYouTubePlay({required String urlYoutube, required String viewId}) {
  // Register a factory to create the iframe element
  platformViewRegistry.registerViewFactory(
    viewId,
    (int viewId) => IFrameElement()
      ..width = '560'
      ..height = '315'
      ..src = urlYoutube
      ..style.border = 'none'
      ..allowFullscreen = true,
  );

  return HtmlElementView(viewType: viewId);
}
