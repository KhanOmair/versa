import 'package:flutter/material.dart';
import 'package:versa_web/utils/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures container takes full width
      padding: const EdgeInsets.all(32.0),
      color: AppTheme.primaryLight, // FFFFFF
      alignment: Alignment.centerLeft, // Aligns container content to the left
      child: Container(
        constraints:
            const BoxConstraints(maxWidth: 1200), // Maximum width constraint
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns column items to the left
          children: [
            // Header
            const SelectableText(
              'About Us',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark, // 252525
                height: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            // Subheader
            SelectableText(
              'Transforming Ideas into Digital Reality',
              style: TextStyle(
                fontSize: 24,
                color:
                    AppTheme.textDark.withOpacity(0.8), // 252525 with opacity
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            // Main content
            _buildParagraph(
              'Welcome to Versa, where innovation meets transformation. We are a SaaS company driven by the boundless energy of young talent and fortified by a wealth of experience. Our mission is simple yet profound: to revolutionize the way businesses approach their software challenges, enabling them to become industry leaders. The name Versa, inspired by the concept of "vice-versa," reflects our unwavering commitment to reversing your hurdles and turning them into stepping stones for success.',
            ),
            const SizedBox(height: 24),
            _buildParagraph(
              'At Versa, we pride ourselves on being more than just a service provider—we are your growth partners. From humble beginnings brainstorming in vibrant cafes to collaborating with diverse clients across industries, we\'ve mastered the art of identifying software requirements that truly matter. Our solutions are not one-size-fits-all; they are carefully crafted to align with your unique vision and business goals. Whether you\'re looking to modernize outdated systems, streamline operations, or develop cutting-edge applications, we ensure that every solution we deliver is intuitive, scalable, and future-ready.',
            ),
            const SizedBox(height: 24),
            _buildParagraph(
              'What sets us apart is our passion for problem-solving and our dedication to excellence. We believe that the best software doesn\'t just solve problems—it transforms businesses. By understanding the intricacies of your challenges, we design solutions that don\'t just work but thrive in the real world, helping you stay ahead of the curve.',
            ),
            const SizedBox(height: 24),
            _buildParagraph(
              'We know that the digital landscape is ever-evolving, and staying competitive requires agility, creativity, and expertise. That\'s why we\'re here—to provide you with the tools, strategies, and support you need to succeed. Let Versa be the bridge between where you are and where you want to be.',
            ),
            const SizedBox(height: 24),
            _buildParagraph(
              'Your journey toward innovation starts here. Don\'t just take our word for it—experience the Versa difference for yourself. Book an appointment today and let us show you how we can transform your vision into reality, one solution at a time.',
            ),
            // const SizedBox(height: 40),
            // Stats section
            // Row(
            //   mainAxisAlignment:
            //       MainAxisAlignment.start, // Aligns stats to the left
            //   children: [
            //     _buildStatistic('500+', 'Clients Served'),
            //     const SizedBox(width: 30), // Add spacing between stats
            //     _buildStatistic('50+', 'Team Members'),
            //     const SizedBox(width: 30),
            //     _buildStatistic('10+', 'Years Experience'),
            //     const SizedBox(width: 30),
            //     _buildStatistic('98%', 'Client Satisfaction'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Container(
      constraints: const BoxConstraints(
          maxWidth: double.infinity), // Limit paragraph width
      child: SelectableText(
        text,
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: AppTheme.textDark.withOpacity(0.8), // 252525 with opacity
        ),
      ),
    );
  }

  Widget _buildStatistic(String number, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns stat content to the left
        children: [
          SelectableText(
            number,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          SelectableText(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
