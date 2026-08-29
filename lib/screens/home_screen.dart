import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/project_card.dart';
import '../models/project.dart';
import 'projects_screen.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import '../data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onNavItemTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        selectedIndex: _selectedIndex,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomeContent(),
          ProjectsScreen(),
          AboutScreen(),
          ContactScreen(),
        ],
      ),
      bottomNavigationBar: Footer(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: CircleAvatar(
              radius: isMobile ? 60 : 80,
              backgroundColor: Colors.blue.withValues(alpha: 0.1),
              child: const Icon(
                Icons.person,
                size: 80,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Hello, I\'m',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 8),
          FadeInDown(
            delay: const Duration(milliseconds: 400),
            child: Text(
              'Your Name',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FadeInDown(
            delay: const Duration(milliseconds: 600),
            child: Text(
              'Flutter Developer',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInDown(
            delay: const Duration(milliseconds: 800),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
              ),
              child: Text(
                'Building beautiful, performant cross-platform applications '
                    'with Flutter. Passionate about clean code and great user experiences.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          FadeInUp(
            delay: const Duration(milliseconds: 1000),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _buildSkillChip('Flutter'),
                _buildSkillChip('Dart'),
                _buildSkillChip('Firebase'),
                _buildSkillChip('REST APIs'),
                _buildSkillChip('BLoC'),
                _buildSkillChip('Provider'),
                _buildSkillChip('Git'),
                _buildSkillChip('CI/CD'),
              ],
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 1200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  'GitHub',
                  Icons.code,
                      () => _launchUrl('https://github.com/afahitech'),
                ),
                const SizedBox(width: 12),
                _buildSocialButton(
                  'LinkedIn',
                  Icons.business_center,
                      () => _launchUrl('https://linkedin.com/in/afa-hitech/'),
                ),
                const SizedBox(width: 12),
                _buildSocialButton(
                  'Twitter',
                  Icons.chat,
                      () => _launchUrl('https://twitter.com/yourusername'),
                ),
                const SizedBox(width: 12),
                _buildSocialButton(
                  'YouTube',
                  Icons.play_circle_filled,
                      () => _launchUrl('https://youtube.com/@muhammadataurrahman2885'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 1400),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade50, Colors.purple.shade50],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    '🚀 Featured Projects',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: PortfolioData.projects
                          .where((p) => p.isFeatured)
                          .length,
                      itemBuilder: (context, index) {
                        final featured = PortfolioData.projects
                            .where((p) => p.isFeatured)
                            .toList();
                        return Container(
                          width: 300,
                          margin: const EdgeInsets.only(right: 16),
                          child: ProjectCard(project: featured[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 1600),
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to projects
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('View All Projects'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.withValues(alpha: 0.1),
      labelStyle: const TextStyle(color: Colors.blue),
      side: BorderSide.none,
    );
  }

  Widget _buildSocialButton(
      String label,
      IconData icon,
      VoidCallback onPressed,
      ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}