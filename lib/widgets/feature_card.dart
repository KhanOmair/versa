import 'package:flutter/material.dart';
import 'package:versa_web/utils/app_theme.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const FeatureCard({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile(context) ? 16.0 : 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isMobile(context)
            ? Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 1.0,
              )
            : null,
        boxShadow: isMobile(context)
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(isMobile(context) ? 8.0 : 12.0),
            decoration: BoxDecoration(
              color: AppTheme.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppTheme.accent,
              size: isMobile(context) ? 20 : 24,
            ),
          ),
          SizedBox(height: isMobile(context) ? 12 : 16),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile(context) ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
          SizedBox(height: isMobile(context) ? 8 : 12),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile(context) ? 12 : 14,
              height: 1.5,
              color: AppTheme.textDark.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
