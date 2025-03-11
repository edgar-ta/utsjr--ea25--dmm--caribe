import 'package:flutter/material.dart';

class UnitsIndicator extends StatelessWidget {
  final double value;
  final String unit;
  final int decimals;

  const UnitsIndicator({
    super.key,
    required this.value,
    required this.unit,
    this.decimals = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toStringAsFixed(decimals),
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textHeightBehavior: TextHeightBehavior(
            applyHeightToLastDescent: false,
          ),
        ),
        Text(
          value != 1 ? "${unit}s" : unit,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
