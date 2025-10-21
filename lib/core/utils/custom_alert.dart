import 'package:flutter/material.dart';

class CustomAlert {
  static Future<void> show(
    BuildContext context, {
    String? title,
    String? description,
    Function()? onYes,
    Function()? onCancel,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: title != null
              ? Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: description == null
              ? null
              : SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(description, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
          titlePadding: EdgeInsets.only(
            left: 18,
            top: 18,
            right: 18,
            bottom: 4,
          ),
          contentPadding: EdgeInsets.only(left: 18, bottom: 18, right: 18),
          actionsPadding: EdgeInsets.only(right: 18, bottom: 8),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 18,
                ),
              ),
              onPressed: onCancel ?? () => Navigator.pop(context),
              child: const Text(
                'Batal',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                if (onYes != null) {
                  onYes.call();
                }
              },
              style: FilledButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 28,
                ),
              ),
              child: const Text(
                'Ya',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
