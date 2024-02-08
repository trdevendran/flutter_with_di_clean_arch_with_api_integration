import 'package:flutter/material.dart';

/// Displays [CircularProgressIndicator] in a [ListTile] or [Row]
/// with a hint as placeholder message for the better user experience
class LoaderWidget extends StatelessWidget {
  final String message;

  const LoaderWidget({super.key, this.message = "Fetching..."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CircularProgressIndicator(),
          Padding(padding: const EdgeInsets.all(8), child: Text(message))
        ],
      ),
    );
  }
}
