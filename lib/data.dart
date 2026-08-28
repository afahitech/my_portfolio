import 'models/project.dart';

class PortfolioData {
  static final List<Project> projects = [
    Project(
      id: '1',
      title: 'Flutter Finance App',
      description: 'A banking app with real-time transaction tracking',
      imageUrl: 'https://picsum.photos/seed/finance/400/300',
      githubUrl: 'https://github.com/yourusername/finance_app',
      liveUrl: 'https://finance-app-demo.vercel.app',
      technologies: ['Flutter', 'BLoC', 'Hive', 'Charts'],
      date: DateTime(2024, 8, 28),
      isFeatured: true,
    ),
    // Add your Flutter projects here
  ];
}