import 'dart:html' as html;
import 'dart:js_util' as js_util;

import 'package:flutter/foundation.dart';

class PushNotifications {
  static Future<String> subscribe() async {
    if (!kIsWeb) {
      return 'Les notifications sont disponibles sur la version web.';
    }

    try {
      final result = await js_util.promiseToFuture<Object?>(
        js_util.callMethod<Object?>(
          html.window,
          'bloganSubscribe',
          [],
        )!,
      );

      final converted = js_util.dartify(result);

      if (converted is Map) {
        return converted['message']?.toString() ??
            'Les notifications ont été activées.';
      }

      return 'Les notifications ont été activées.';
    } catch (e) {
      return 'Impossible d’activer les notifications : $e';
    }
  }
}
