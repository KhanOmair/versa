import 'package:flutter/material.dart';
import 'package:versa_web/utils/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.primaryDark,
      padding: EdgeInsets.symmetric(
        vertical: isMobile(context) ? 20 : 24,
        horizontal: isMobile(context) ? 20 : 32,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: isMobile(context)
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     // Logo and company info
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Image.asset(
        //           'assets/images/versa_logo.png',
        //           height: 40,
        //           fit: BoxFit.contain,
        //         ),
        //         const SizedBox(height: 16),
        //         Text(
        //           'Transforming businesses with\ninnovative software solutions.',
        //           style: TextStyle(
        //             color: AppTheme.primaryLight.withOpacity(0.8),
        //             fontSize: 14,
        //             height: 1.5,
        //           ),
        //         ),
        //       ],
        //     ),
        //     // Quick Links
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Text(
        //           'Quick Links',
        //           style: TextStyle(
        //             color: AppTheme.primaryLight,
        //             fontSize: 16,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         const SizedBox(height: 16),
        //         _buildFooterLink('About Us'),
        //         _buildFooterLink('Products'),
        //         _buildFooterLink('Services'),
        //         _buildFooterLink('Contact'),
        //       ],
        //     ),
        //     // Contact Info
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Text(
        //           'Contact',
        //           style: TextStyle(
        //             color: AppTheme.primaryLight,
        //             fontSize: 16,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         const SizedBox(height: 16),
        //         _buildContactInfo(Icons.email, 'sales@versahq.online'),
        //         const SizedBox(height: 8),
        //         _buildContactInfo(Icons.phone, '+1 (602) 838-0848'),
        //       ],
        //     ),
        //   ],
        // ),
        const SizedBox(height: 2),
        Divider(color: AppTheme.primaryLight.withOpacity(0.1)),
        const SizedBox(height: 10),
        // Copyright text
        Text(
          '© ${DateTime.now().year} Versa. All rights reserved.',
          style: TextStyle(
            color: AppTheme.primaryLight.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        // Logo and company info
        // Image.asset(
        //   'assets/images/versa_logo.png',
        //   height: 32,
        //   fit: BoxFit.contain,
        // ),
        // const SizedBox(height: 16),
        // Text(
        //   'Transforming businesses with\ninnovative software solutions.',
        //   style: TextStyle(
        //     color: AppTheme.primaryLight.withOpacity(0.8),
        //     fontSize: 12,
        //     height: 1.5,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
        // const SizedBox(height: 24),
        // // Quick Links
        // const Text(
        //   'Quick Links',
        //   style: TextStyle(
        //     color: AppTheme.primaryLight,
        //     fontSize: 14,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        // const SizedBox(height: 12),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     _buildFooterLink('About Us'),
        //     const SizedBox(width: 16),
        //     _buildFooterLink('Products'),
        //     const SizedBox(width: 16),
        //     _buildFooterLink('Services'),
        //     const SizedBox(width: 16),
        //     _buildFooterLink('Contact'),
        //   ],
        // ),
        // const SizedBox(height: 24),
        // // Contact Info
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     _buildContactInfo(Icons.email, 'sales@versahq.online'),
        //     const SizedBox(width: 16),
        //     _buildContactInfo(Icons.phone, '+1 (602) 838-0848'),
        //   ],
        // ),
        const SizedBox(height: 1),
        Divider(color: AppTheme.primaryLight.withOpacity(0.1)),
        const SizedBox(height: 8),
        // Copyright text
        Text(
          '© ${DateTime.now().year} Versa. All rights reserved.',
          style: TextStyle(
            color: AppTheme.primaryLight.withOpacity(0.6),
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.primaryLight.withOpacity(0.8),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: AppTheme.primaryLight.withOpacity(0.8),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: AppTheme.primaryLight.withOpacity(0.8),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
