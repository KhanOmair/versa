import 'package:flutter/material.dart';
import 'package:versa_web/utils/app_theme.dart';
import 'package:versa_web/screens/home_page.dart';

class HeroSection extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const HeroSection({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  void _scrollToContact(BuildContext context) {
    final homeState = context.findAncestorStateOfType<HomePageState>();
    if (homeState != null) {
      homeState.scrollToSection(homeState.contactKey, 'contact');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Container(
          height: isMobile(context) ? 400 : 500, // Reduced height for mobile
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.primaryDark, // 252525
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primaryDark, // 252525
                AppTheme.primaryDark.withOpacity(0.95), // Slightly lighter
                AppTheme.primaryDark.withOpacity(0.9), // Even lighter
              ],
              stops: const [0.2, 0.5, 0.9],
            ),
          ),
          child: Stack(
            children: [
              // Background Logo
              Positioned.fill(
                child: Center(
                  child: Opacity(
                    opacity: 0.15, // Subtle background logo
                    child: Image.asset(
                      'assets/images/versa_logo.png',
                      width: isMobile(context) ? 250 : 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // Content
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile(context) ? 20.0 : 32.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Transform Your Business\nWith Our Tailored Software Solutions',
                        style: TextStyle(
                          fontSize: isMobile(context) ? 32 : 48,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryLight, // FFFFFF
                          letterSpacing: 2,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isMobile(context) ? 20 : 30),
                      _buildGetStartedButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _scrollToContact(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.accent, // FA5F1A
        foregroundColor: AppTheme.primaryLight, // FFFFFF
        padding: EdgeInsets.symmetric(
          horizontal: isMobile(context) ? 30 : 50,
          vertical: isMobile(context) ? 16 : 22,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ).copyWith(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return AppTheme.sectionBg; // F7F0F0 on hover
            }
            return null;
          },
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyle(
          fontSize: isMobile(context) ? 16 : 18,
          fontWeight: FontWeight.w600,
          color: AppTheme.primaryLight, // FFFFFF
        ),
      ),
    );
  }
}
