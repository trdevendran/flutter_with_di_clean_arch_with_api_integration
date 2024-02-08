import 'package:flutter/material.dart';

/// Displays [CircularProgressIndicator] with hint message as a placeholder
/// for the better user experience
class FooterLoadingWidget extends StatelessWidget {
  final String message;

  const FooterLoadingWidget({super.key, this.message = "Loading more..."});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              Padding(padding: const EdgeInsets.all(8), child: Text(message))
            ],
          ),
        ));
  }
}
