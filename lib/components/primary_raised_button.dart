import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrimaryRaisedButton extends StatelessWidget {
  const PrimaryRaisedButton({this.onPressed, this.label});

  final Widget label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => RaisedButton.icon(
        onPressed: onPressed,
        label: label,
        icon: const Icon(Icons.add),
      );
}
