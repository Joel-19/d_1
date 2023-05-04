import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static alert(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 138, 33, 33)),
            onPressed: () {
              Navigator.pop(_);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}

abstract class ProgressDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return WillPopScope(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromARGB(255, 228, 202, 198).withOpacity(0.9),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          onWillPop: () async => false,
        );
      },
    );
  }

  static dissmiss(BuildContext context) {
    Navigator.pop(context);
  }
}
