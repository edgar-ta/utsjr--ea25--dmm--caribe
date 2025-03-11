import 'package:caribe/styles/app_colors.dart';
import 'package:flutter/material.dart';

class IconicButton extends StatelessWidget {
  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final IconData icon;

  const IconicButton({
    super.key,
    required this.label,
    required this.icon,
    this.foregroundColor = AppColors.arenaCalida,
    this.backgroundColor = AppColors.naranjaAtardecer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text(label),
        icon: Icon(
          icon,
          color: foregroundColor,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            backgroundColor,
          ),
          foregroundColor: WidgetStateProperty.all(foregroundColor),
          shape: WidgetStateProperty.all(
            ContinuousRectangleBorder(),
          ),
        ),
      ),
    );
  }
}
