import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:animate_do/animate_do.dart';
import '../widgets/project_card.dart';
import '../data.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final projects = PortfolioData.projects;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            FadeInDown(
              child: Text(
                'My Projects',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: Text(
                'Here are some of my recent Flutter projects',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Filter chips (optional)
            FadeInDown(
              delay: const Duration(milliseconds: 400),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildFilterChip('All', true),
                  _buildFilterChip('Flutter', false),
                  _buildFilterChip('Firebase', false),
                  _buildFilterChip('AI/ML', false),
                  _buildFilterChip('IoT', false),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Project grid
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : (ResponsiveBreakpoints.of(context).isTablet ? 2 : 3),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    project: projects[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        // Filter logic
      },
      backgroundColor: Colors.grey[200],
      selectedColor: Colors.blue.withValues(alpha: 0.2),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}