import 'package:flutter/material.dart';
import 'package:versa_web/widgets/sections/about_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/products_section.dart';
import '../widgets/sections/services_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/footer_section.dart';
import '../utils/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey productsKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();

  // Track only selected section
  String _selectedSection = '';

  // Track if scroll was triggered by button click
  bool _isButtonScroll = false;
  // Track if scroll animation is in progress
  bool _isScrolling = false;

  bool get isMobile => MediaQuery.of(context).size.width < 800;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // Add scroll listener after a frame to ensure context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_onScroll);
      // Initial check for current section
      _onScroll();
    });
  }

  void scrollToSection(GlobalKey key, String section) {
    final context = key.currentContext;
    if (context != null) {
      // Set flags to indicate button-triggered scroll
      _isButtonScroll = true;
      _isScrolling = true;

      final box = context.findRenderObject() as RenderBox;
      final offset = box.localToGlobal(Offset.zero);
      final appBarHeight = AppBar().preferredSize.height;
      final scrollPosition =
          offset.dy + _scrollController.offset - appBarHeight;

      _scrollController
          .animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      )
          .then((_) {
        // Reset scrolling flag after animation completes
        _isScrolling = false;
      });

      // Update selected section
      setState(() {
        _selectedSection = section;
      });
    }
  }

  // Track current section
  String _currentSection = '';

  void _onScroll() {
    if (!mounted) return;

    // Only clear selection if scroll was manual and not during animation
    if (!_isButtonScroll && !_isScrolling) {
      setState(() {
        _selectedSection = '';
      });
    }

    // Reset the button scroll flag
    _isButtonScroll = false;

    // Get viewport height to calculate visibility
    // final viewportHeight = MediaQuery.of(context).size.height;
    final scrollPosition = _scrollController.offset;
    final appBarHeight = AppBar().preferredSize.height;

    // Get section positions with AppBar offset
    final sections = [
      ('about', _getSectionPosition(aboutKey)),
      ('products', _getSectionPosition(productsKey)),
      ('services', _getSectionPosition(servicesKey)),
      ('contact', _getSectionPosition(contactKey)),
    ];

    // Find the current section based on scroll position
    String newSection = '';
    for (int i = 0; i < sections.length; i++) {
      final currentPos = sections[i].$2;
      final nextPos =
          i < sections.length - 1 ? sections[i + 1].$2 : double.infinity;

      if (currentPos != null) {
        // Adjust threshold to account for AppBar and add some padding
        final adjustedScrollPosition = scrollPosition + appBarHeight + 100;

        if (adjustedScrollPosition >= currentPos &&
            (nextPos == null || adjustedScrollPosition < nextPos)) {
          newSection = sections[i].$1;
          break;
        }
      }
    }

    // Only update state if section changed
    if (_currentSection != newSection) {
      setState(() {
        _currentSection = newSection;
      });
    }
  }

  double? _getSectionPosition(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);
      return position.dy;
    }
    return null;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isMobile ? _buildMobileAppBar() : _buildDesktopAppBar(),
      drawer: isMobile ? _buildMobileDrawer() : null,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) => false,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              HeroSection(
                fadeAnimation: _fadeAnimation,
                slideAnimation: _slideAnimation,
              ),
              AboutSection(key: aboutKey),
              ProductsSection(key: productsKey),
              ServicesSection(key: servicesKey),
              ContactSection(key: contactKey),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildMobileAppBar() {
    return AppBar(
      backgroundColor: AppTheme.primaryDark,
      elevation: 0,
      title: Image.asset(
        'assets/images/versa_logo.png',
        height: 30,
        fit: BoxFit.contain,
      ),
      centerTitle: true,
    );
  }

  PreferredSizeWidget _buildDesktopAppBar() {
    return AppBar(
      backgroundColor: AppTheme.primaryDark,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/images/versa_logo.png',
            height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Text(
            'Versa',
            style: TextStyle(
              color: AppTheme.primaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        _buildNavButton(
            'About Us', () => scrollToSection(aboutKey, 'about'), 'about'),
        _buildNavButton('Products',
            () => scrollToSection(productsKey, 'products'), 'products'),
        _buildNavButton('Services',
            () => scrollToSection(servicesKey, 'services'), 'services'),
        _buildNavButton('Contact Us',
            () => scrollToSection(contactKey, 'contact'), 'contact'),
      ],
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: Container(
        color: AppTheme.primaryLight,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppTheme.primaryDark.withOpacity(0.9),
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.primaryLight.withOpacity(0.1),
                  ),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/versa_logo.png',
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            _buildMobileNavItem(
                'About Us', () => scrollToSection(aboutKey, 'about'), 'about'),
            _buildMobileNavItem('Products',
                () => scrollToSection(productsKey, 'products'), 'products'),
            _buildMobileNavItem('Services',
                () => scrollToSection(servicesKey, 'services'), 'services'),
            _buildMobileNavItem('Contact Us',
                () => scrollToSection(contactKey, 'contact'), 'contact'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '© 2024 Versa',
                style: TextStyle(
                  color: AppTheme.primaryLight.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileNavItem(
      String text, VoidCallback onPressed, String section) {
    final bool isSelected = _selectedSection == section;

    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppTheme.accent : AppTheme.primaryLight,
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        onPressed();
      },
      selected: isSelected,
      selectedTileColor: AppTheme.accent.withOpacity(0.1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    );
  }

  Widget _buildNavButton(String text, VoidCallback onPressed, String section) {
    final bool isSelected = _selectedSection == section;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() {}),
          onExit: (_) => setState(() {}),
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return AppTheme.accent.withOpacity(0.1);
                  }
                  return null;
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered) || isSelected) {
                    return AppTheme.accent;
                  }
                  return AppTheme.primaryLight;
                },
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (isSelected)
                  Container(
                    height: 2,
                    width: 20,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.accent,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
