import 'package:flutter/material.dart';
import 'package:versa_web/utils/app_theme.dart';
import '../feature_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile(context) ? 20.0 : 32.0),
      color: AppTheme.primaryLight,
      child: Column(
        children: [
          // First split section
          Container(
            constraints: BoxConstraints(
              minHeight: isMobile(context) ? 500 : 530,
            ),
            child: isMobile(context)
                ? Column(
                    // Mobile layout as column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text content first
                      Text(
                        'Enterprise Solutions\nThat Scale',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildParagraph(
                        'At Versa, we don\'t just deliver solutions - we craft possibilities tailored to your unique needs. Our expertise lies in developing bespoke software solutions that seamlessly align with your business goals.',
                        true,
                      ),
                      const SizedBox(height: 16),
                      _buildParagraph(
                        'But we don\'t stop at software. Our consultation services guide you every step of the way, ensuring your business not only adapts but thrives in today\'s fast-paced digital landscape.Need to amplify your online presence? We excel in Social Media Marketing and Digital Marketing strategies that captivate your audience and drive measurable results. From creating a buzz on social platforms to structuring high-performing Google Ads campaigns, we\'re the catalyst for your brand\'s growth.',
                        true,
                      ),
                      const SizedBox(height: 24),
                      // Image below text
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/services.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Stack(
                        //   children: [
                        //     Positioned(
                        //       right: 16,
                        //       top: 16,
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         decoration: BoxDecoration(
                        //           color: AppTheme.primaryLight,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: const Icon(
                        //           Icons.cloud_done,
                        //           size: 24,
                        //           color: AppTheme.accent,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ],
                  )
                : Row(
                    // Desktop layout remains unchanged
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side - Text content
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: isMobile(context) ? 16.0 : 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enterprise Solutions\nThat Scale',
                                style: TextStyle(
                                  fontSize: isMobile(context) ? 28 : 40,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textDark,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: isMobile(context) ? 20 : 30),
                              _buildParagraph(
                                'At Versa, we don\'t just deliver solutions - we craft possibilities tailored to your unique needs. Our expertise lies in developing bespoke software solutions that seamlessly align with your business goals. Whether you need an intuitive platform to streamline operations or an innovative application to enhance customer engagement, we bring your vision to life with precision and excellence.',
                                isMobile(context),
                              ),
                              SizedBox(height: isMobile(context) ? 16 : 16),
                              _buildParagraph(
                                'But we don\'t stop at software. Our consultation services guide you every step of the way, ensuring your business not only adapts but thrives in today\'s fast-paced digital landscape. Need to amplify your online presence? We excel in Social Media Marketing and Digital Marketing strategies that captivate your audience and drive measurable results. From creating a buzz on social platforms to structuring high-performing Google Ads campaigns, we\'re the catalyst for your brand\'s growth.',
                                isMobile(context),
                              ),
                              SizedBox(height: isMobile(context) ? 16 : 16),
                              _buildParagraph(
                                'When you partner with us, you\'re not just getting a service provider – you\'re gaining a team of dedicated experts committed to making your success inevitable. Whatever we do, we excel at it, and we ensure our work speaks volumes about your brand. Let\'s transform challenges into opportunities and ideas into reality, together.',
                                isMobile(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right side - Image placeholder
                      Expanded(
                        child: Container(
                          height: isMobile(context) ? 300 : 550,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                isMobile(context) ? 16 : 20),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/services.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // child: Stack(
                          //   children: [
                          //     Positioned(
                          //       right: isMobile(context) ? 16 : 20,
                          //       top: isMobile(context) ? 16 : 20,
                          //       child: Container(
                          //         padding: EdgeInsets.all(
                          //             isMobile(context) ? 8 : 12),
                          //         decoration: BoxDecoration(
                          //           color: AppTheme.primaryLight,
                          //           borderRadius: BorderRadius.circular(50),
                          //         ),
                          //         child: Icon(
                          //           Icons.cloud_done,
                          //           size: isMobile(context) ? 24 : 30,
                          //           color: AppTheme.accent,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: isMobile(context) ? 40 : 60),
          // Second split section
          Container(
            constraints: BoxConstraints(
              minHeight: isMobile(context) ? 500 : 500,
            ),
            child: isMobile(context)
                ? Column(
                    // Mobile layout as column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Innovative Solutions\nFor Modern Business',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildParagraph(
                        'In today\'s digital-first world, a robust online presence is no longer optional—it\'s the backbone of a thriving business. A well-designed website acts as your 24/7 storefront, showcasing your offerings, building trust, and making it easy for customers to connect with you. Mobile apps take this a step further, offering convenience, personalization, and engagement that keeps your audience coming back for more.',
                        true,
                      ),
                      const SizedBox(height: 16),
                      _buildParagraph(
                        'But visibility is key, and that\'s where our digital marketing and Google Ads services come into play. With targeted campaigns and data-driven strategies, we ensure your brand reaches the right audience at the right time. Effective digital marketing builds awareness, drives traffic, and turns clicks into conversions. Structured Google Ads amplify this impact by putting your business at the top of search results when potential customers are actively looking for what you offer.',
                        true,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/services2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Stack(
                        //   children: [
                        //     Positioned(
                        //       left: 16,
                        //       top: 16,
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         decoration: BoxDecoration(
                        //           color: AppTheme.primaryLight,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: const Icon(
                        //           Icons.rocket_launch,
                        //           size: 24,
                        //           color: AppTheme.accent,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ],
                  )
                : Row(
                    // Desktop layout remains unchanged
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side - Image placeholder
                      Expanded(
                        child: Container(
                          height: isMobile(context) ? 300 : 550,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                isMobile(context) ? 16 : 20),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/services2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // child: Stack(
                          //   children: [
                          //     Positioned(
                          //       left: isMobile(context) ? 16 : 20,
                          //       top: isMobile(context) ? 16 : 20,
                          //       child: Container(
                          //         padding: EdgeInsets.all(
                          //             isMobile(context) ? 8 : 12),
                          //         decoration: BoxDecoration(
                          //           color: AppTheme.primaryLight,
                          //           borderRadius: BorderRadius.circular(50),
                          //         ),
                          //         child: Icon(
                          //           Icons.rocket_launch,
                          //           size: isMobile(context) ? 24 : 30,
                          //           color: AppTheme.accent,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                      // Right side - Text content
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: isMobile(context) ? 16.0 : 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Innovative Solutions\nFor Modern Business',
                                style: TextStyle(
                                  fontSize: isMobile(context) ? 28 : 40,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textDark,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: isMobile(context) ? 20 : 30),
                              _buildParagraph(
                                'In today\'s digital-first world, a robust online presence is no longer optional—it\'s the backbone of a thriving business. A well-designed website acts as your 24/7 storefront, showcasing your offerings, building trust, and making it easy for customers to connect with you. Mobile apps take this a step further, offering convenience, personalization, and engagement that keeps your audience coming back for more.',
                                isMobile(context),
                              ),
                              SizedBox(height: isMobile(context) ? 16 : 16),
                              _buildParagraph(
                                'But visibility is key, and that\'s where our digital marketing and Google Ads services come into play. With targeted campaigns and data-driven strategies, we ensure your brand reaches the right audience at the right time. Effective digital marketing builds awareness, drives traffic, and turns clicks into conversions. Structured Google Ads amplify this impact by putting your business at the top of search results when potential customers are actively looking for what you offer.',
                                isMobile(context),
                              ),
                              SizedBox(height: isMobile(context) ? 16 : 16),
                              _buildParagraph(
                                'These tools don\'t just attract more customers—they create measurable opportunities to grow revenue, scale operations, and solidify your position in the market. By combining powerful online platforms with strategic marketing, we help you not just compete, but lead in your industry.',
                                isMobile(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: isMobile(context) ? 20 : 40),
          // Feature cards section
          Container(
            color: AppTheme.primaryLight,
            padding: EdgeInsets.symmetric(
              vertical: isMobile(context) ? 20 : 20,
              horizontal: isMobile(context) ? 10 : 15.0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: isMobile(context) ? 180 : 280,
                    child: const FeatureCard(
                      title: 'Software Solutions',
                      icon: Icons.cloud,
                      description: 'Scalable solutions for your business',
                    ),
                  ),
                  SizedBox(width: isMobile(context) ? 12 : 20),
                  SizedBox(
                    width: isMobile(context) ? 180 : 280,
                    child: const FeatureCard(
                      title: 'Digital Marketing',
                      icon: Icons.trending_up,
                      description: 'Campaigns that drive growth & engagement',
                    ),
                  ),
                  SizedBox(width: isMobile(context) ? 12 : 20),
                  SizedBox(
                    width: isMobile(context) ? 180 : 280,
                    child: const FeatureCard(
                      title: 'Social Media',
                      icon: Icons.people,
                      description:
                          'Build your brand presence across social platforms',
                    ),
                  ),
                  SizedBox(width: isMobile(context) ? 12 : 20),
                  SizedBox(
                    width: isMobile(context) ? 180 : 280,
                    child: const FeatureCard(
                      title: 'Google Ads',
                      icon: Icons.ads_click,
                      description: 'Optimized campaigns for\nmaximum ROI',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text, bool isMobile) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isMobile ? 14 : 16,
        height: 1.6,
        color: AppTheme.textDark.withOpacity(0.8),
      ),
      // softWrap: true,
      // overflow: TextOverflow.visible,
    );
  }
}
