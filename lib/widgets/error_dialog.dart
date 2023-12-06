
import 'package:flutter/material.dart';

void errorDialog(BuildContext context, String title, String content) {

  
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  
}