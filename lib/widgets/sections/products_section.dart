import 'package:flutter/material.dart';
import 'package:versa_web/utils/app_theme.dart';
import '../feature_card.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

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
            padding: EdgeInsets.symmetric(
              vertical: isMobile(context) ? 20.0 : 40.0,
            ),
            child: isMobile(context)
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context),
          ),
          // Feature cards section - only show on desktop
          if (!isMobile(context)) ...[
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: const [
                    FeatureCard(
                      title: 'Apps & Websites',
                      icon: Icons.storage,
                      description: 'Secure online presence solutions',
                    ),
                    SizedBox(width: 20),
                    FeatureCard(
                      title: 'Office Solutions',
                      icon: Icons.api,
                      description: 'Management & Productivity Tools',
                    ),
                    SizedBox(width: 20),
                    FeatureCard(
                      title: 'Tracking Systems',
                      icon: Icons.monitor_heart,
                      description: 'Efficient & Large Scale Solutions',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title with gradient background
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          width: double.infinity,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Transformative Digital\nSolutions',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
                height: 1.2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Service Cards
        _buildMobileServiceCard(
          title: 'Warehouse Inventory Management',
          icon: Icons.local_shipping,
          description:
              'Streamline your operations and take the guesswork out of inventory tracking with our advanced Warehouse Inventory Management solution. Designed for accuracy and efficiency, it empowers you to manage stock levels, track shipments, and reduce overhead costs in real-time. Whether you\'re handling small-scale inventory or large-scale logistics, our solution optimizes every aspect of your supply chain, helping you reduce errors, minimize waste, and boost productivity. It\'s the ultimate tool to keep your warehouse running like a well-oiled machine.',
          imagePath: 'assets/images/inventory_solutions.png',
          iconAlignment: Alignment.topRight,
        ),
        const SizedBox(height: 24),

        _buildMobileServiceCard(
          title: 'In-Office Solutions',
          icon: Icons.route,
          description:
              'Simplify workplace management and boost productivity with our suite of In-Office Solutions. From an intuitive attendance manager that tracks employee time seamlessly, to a smart calendar that organizes schedules effortlessly, and a task manager that ensures no deadline is missed, our tools are designed to eliminate inefficiencies. By integrating these solutions into your daily operations, you\'ll foster better collaboration, improve time management, and focus on what truly matters—growing your business.',
          imagePath: 'assets/images/office_solutions.jpg',
          iconAlignment: Alignment.topLeft,
        ),
        const SizedBox(height: 24),

        _buildMobileServiceCard(
          title: 'E-Commerce Website and App',
          icon: Icons.gps_fixed,
          description:
              'Elevate your online presence and drive sales with our tailored E-Commerce Website and App solutions. We create user-friendly platforms that showcase your products beautifully and offer a seamless shopping experience across devices. From intuitive navigation to secure payment gateways, every detail is optimized for performance and customer satisfaction. With integrated analytics and marketing tools, you can easily track performance and adapt strategies to maximize revenue. Take your business global and let your brand thrive in the competitive e-commerce landscape.',
          imagePath: 'assets/images/e-commerce.png',
          iconAlignment: Alignment.topRight,
        ),

        const SizedBox(height: 32),

        // Feature cards with improved scrolling
        SizedBox(
          height: 150, // Fixed height for feature cards
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: const [
              FeatureCard(
                title: 'Apps & Websites',
                icon: Icons.storage,
                description: 'Secure online presence solutions',
              ),
              SizedBox(width: 16),
              FeatureCard(
                title: 'Office Solutions',
                icon: Icons.api,
                description: 'Management & Productivity Tools',
              ),
              SizedBox(width: 16),
              FeatureCard(
                title: 'Tracking Systems',
                icon: Icons.monitor_heart,
                description: 'Efficient & Large Scale Solutions',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileServiceCard({
    required String title,
    required IconData icon,
    required String description,
    required String imagePath,
    required Alignment iconAlignment,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.primaryLight,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryDark.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with fixed height
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            // child: _buildIconOverlay(icon, iconAlignment),
          ),
          // Content padding with flexible height
          Padding(
            padding: const EdgeInsets.all(20.0), // Increased padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.accent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        icon,
                        color: AppTheme.accent,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Increased spacing
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6, // Increased line height
                    color: AppTheme.textDark.withOpacity(0.8),
                  ),
                  // Remove any text overflow restrictions
                  // overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Text content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Transformative \nDigital Solutions',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 30),
                _buildServicePoint(
                  'Warehouse Inventory Management',
                  Icons.local_shipping,
                  'Streamline your operations and take the guesswork out of inventory tracking with our advanced Warehouse Inventory Management solution. Designed for accuracy and efficiency, it empowers you to manage stock levels, track shipments, and reduce overhead costs in real-time. Whether you\'re handling small-scale inventory or large-scale logistics, our solution optimizes every aspect of your supply chain, helping you reduce errors, minimize waste, and boost productivity. It\'s the ultimate tool to keep your warehouse running like a well-oiled machine.',
                ),
                const SizedBox(height: 20),
                _buildServicePoint(
                  'In-Office Solutions',
                  Icons.route,
                  'Simplify workplace management and boost productivity with our suite of In-Office Solutions. From an intuitive attendance manager that tracks employee time seamlessly, to a smart calendar that organizes schedules effortlessly, and a task manager that ensures no deadline is missed, our tools are designed to eliminate inefficiencies. By integrating these solutions into your daily operations, you\'ll foster better collaboration, improve time management, and focus on what truly matters—growing your business.',
                ),
                const SizedBox(height: 20),
                _buildServicePoint(
                  'E-Commerce Website and App',
                  Icons.gps_fixed,
                  'Elevate your online presence and drive sales with our tailored E-Commerce Website and App solutions. We create user-friendly platforms that showcase your products beautifully and offer a seamless shopping experience across devices. From intuitive navigation to secure payment gateways, every detail is optimized for performance and customer satisfaction. With integrated analytics and marketing tools, you can easily track performance and adapt strategies to maximize revenue. Take your business global and let your brand thrive in the competitive e-commerce landscape.',
                ),
              ],
            ),
          ),
        ),
        // Right side - Images Column
        Expanded(
          child: Column(
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/inventory_solutions.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // child:
                // _buildIconOverlay(Icons.local_shipping, Alignment.topRight),
              ),
              const SizedBox(height: 20),
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/office_solutions.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: _buildIconOverlay(Icons.inventory_2, Alignment.topLeft),
              ),
              const SizedBox(height: 20),
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/e-commerce.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: _buildIconOverlay(Icons.inventory_2, Alignment.topLeft),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconOverlay(IconData icon, Alignment alignment) {
    return Stack(
      children: [
        Positioned(
          right: alignment == Alignment.topRight ? 20 : null,
          left: alignment == Alignment.topLeft ? 20 : null,
          top: 20,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryLight,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              size: 30,
              color: AppTheme.accent,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServicePoint(String title, IconData icon, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppTheme.accent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textDark,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 44.0),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppTheme.textDark.withOpacity(0.8),
              // maxLines: 5, // Set a limit if needed, or remove this line for unlimited
              // softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
