import 'package:flutter/material.dart';

final class Message {
  static showSnackBar(BuildContext context, final String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

mixin MessageControllerMixin {
  final ValueNotifier<String?> _messageSnackBar = ValueNotifier(null);
  String? get messageSnackBar => _messageSnackBar.value;

  void clearMessage() => _messageSnackBar.value = null;

  void showSnackBar(String message) {
    _messageSnackBar.value = message;
  }
}

mixin MessageViewMixin<T extends StatefulWidget> on State<T> {
  void messageListener(MessageControllerMixin controller) {
    controller._messageSnackBar.addListener(() {
      final MessageControllerMixin(messageSnackBar: message) = controller;
      if (message != null) {
        Message.showSnackBar(context, message);
        controller.clearMessage();
      }
    });
  }
}
