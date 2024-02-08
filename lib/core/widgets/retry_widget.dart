import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  final String buttonTitle;
  final String placeholderMessage;
  final Function() onPressed;

  const RetryWidget(
      {super.key,
      required this.buttonTitle,
      required this.placeholderMessage,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Column(
        children: [
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
          Text(placeholderMessage)
        ],
      ),
    ));
  }
}
