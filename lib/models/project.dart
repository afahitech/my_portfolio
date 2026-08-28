class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String githubUrl;
  final String liveUrl;
  final List<String> technologies;
  final DateTime date;
  final bool isFeatured;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
    required this.liveUrl,
    required this.technologies,
    required this.date,
    this.isFeatured = false,
  });

  // Sample data
  static List<Project> getSampleProjects() {
    return [
      Project(
        id: '1',
        title: 'E-Commerce Flutter App',
        description:
        'A full-featured e-commerce application with Firebase integration, real-time inventory, and payment processing.',
        imageUrl: 'https://picsum.photos/seed/ecommerce/400/300',
        githubUrl: 'https://github.com/yourusername/ecommerce-app',
        liveUrl: 'https://ecommerce-demo.vercel.app',
        technologies: ['Flutter', 'Firebase', 'Provider', 'Stripe'],
        date: DateTime(2024, 1, 15),
        isFeatured: true,
      ),
      Project(
        id: '2',
        title: 'Task Management Dashboard',
        description:
        'A beautiful task management app with drag-and-drop functionality, team collaboration, and real-time updates.',
        imageUrl: 'https://picsum.photos/seed/task/400/300',
        githubUrl: 'https://github.com/yourusername/task-manager',
        liveUrl: 'https://task-manager-demo.vercel.app',
        technologies: ['Flutter', 'BLoC', 'Hive', 'WebSocket'],
        date: DateTime(2024, 2, 20),
      ),
      Project(
        id: '3',
        title: 'Health Tracker App',
        description:
        'A comprehensive health tracking app with workout plans, nutrition tracking, and progress visualization.',
        imageUrl: 'https://picsum.photos/seed/health/400/300',
        githubUrl: 'https://github.com/yourusername/health-tracker',
        liveUrl: 'https://health-tracker-demo.vercel.app',
        technologies: ['Flutter', 'GetX', 'Charts', 'Google Fit API'],
        date: DateTime(2024, 3, 10),
      ),
      Project(
        id: '4',
        title: 'Social Media Client',
        description:
        'A social media client with real-time messaging, story sharing, and interactive feed with animations.',
        imageUrl: 'https://picsum.photos/seed/social/400/300',
        githubUrl: 'https://github.com/yourusername/social-app',
        liveUrl: 'https://social-app-demo.vercel.app',
        technologies: ['Flutter', 'Riverpod', 'Firebase', 'Socket.io'],
        date: DateTime(2024, 4, 5),
      ),
      Project(
        id: '5',
        title: 'Weather Forecast App',
        description:
        'A sleek weather app with real-time forecasts, interactive maps, and beautiful animated weather icons.',
        imageUrl: 'https://picsum.photos/seed/weather/400/300',
        githubUrl: 'https://github.com/yourusername/weather-app',
        liveUrl: 'https://weather-app-demo.vercel.app',
        technologies: ['Flutter', 'Cubit', 'OpenWeather API', 'Google Maps'],
        date: DateTime(2024, 5, 12),
      ),
      Project(
        id: '6',
        title: 'Portfolio Builder',
        description:
        'A tool for developers to create stunning portfolios with drag-and-drop customization and multiple themes.',
        imageUrl: 'https://picsum.photos/seed/portfolio/400/300',
        githubUrl: 'https://github.com/yourusername/portfolio-builder',
        liveUrl: 'https://portfolio-builder-demo.vercel.app',
        technologies: ['Flutter', 'Provider', 'File Picker', 'Theming'],
        date: DateTime(2024, 6, 8),
        isFeatured: true,
      ),
    ];
  }
}