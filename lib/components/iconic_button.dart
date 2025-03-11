import 'package:caribe/styles/app_colors.dart';
import 'package:flutter/material.dart';

class IconicButton extends StatelessWidget {
  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final IconData icon;
  final void Function()? onPressed;
  final bool isEnabled;

  const IconicButton({
    super.key,
    required this.label,
    required this.icon,
    this.foregroundColor = AppColors.arenaCalida,
    this.backgroundColor = AppColors.naranjaAtardecer,
    this.isEnabled = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          if (isEnabled) {
            onPressed?.call();
          }
        },
        label: Text(label),
        icon: Icon(
          icon,
          color: foregroundColor,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isEnabled ? backgroundColor : foregroundColor,
          ),
          foregroundColor: WidgetStateProperty.all(
              isEnabled ? foregroundColor : backgroundColor),
          shape: WidgetStateProperty.all(
            ContinuousRectangleBorder(),
          ),
        ),
      ),
    );
  }
}
