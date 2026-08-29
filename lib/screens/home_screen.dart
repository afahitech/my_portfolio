import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';
import '../widgets/project_card.dart';
import '../widgets/experience_card.dart';
import '../widgets/certificate_card.dart';
import '../data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            _buildHeroSection(context, isMobile),

            // About Section
            _buildAboutSection(context),

            // Education Section
            _buildEducationSection(context),

            // Skills Section
            _buildSkillsSection(context),

            // Experience Section
            _buildExperienceSection(context),

            // Certificates Section
            _buildCertificatesSection(context),

            // Projects Section
            _buildProjectsSection(context),

            // Contact Section
            _buildContactSection(context),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade50, Colors.purple.shade50],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 3),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Available for App Development',
                style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FadeInDown(
            delay: const Duration(milliseconds: 400),
            child: Text(
              "Hi, I'm Muhammad Ataur Rahman",
              style: TextStyle(
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          FadeInDown(
            delay: const Duration(milliseconds: 600),
            child: Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: isMobile ? 20 : 28,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 16),
          FadeInDown(
            delay: const Duration(milliseconds: 800),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 100),
              child: Text(
                'Building modern cross-platform mobile applications with Flutter & Dart. '
                    'Passionate about UI design, problem solving and creating impactful solutions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  height: 1.6,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          FadeInUp(
            delay: const Duration(milliseconds: 1000),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _buildSocialButton(
                  FontAwesomeIcons.github,
                  'GitHub',
                  'https://github.com/afahitech',
                ),
                _buildSocialButton(
                  FontAwesomeIcons.linkedin,
                  'LinkedIn',
                  'https://linkedin.com/in/afahitech',
                ),
                // _buildSocialButton(
                //   FontAwesomeIcons.facebook,
                //   'Facebook',
                //   'https://facebook.com/afahitech',
                // ),
                // _buildSocialButton(
                //   FontAwesomeIcons.twitter,
                //   'Twitter',
                //   'https://twitter.com/afahitech',
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(dynamic icon, String label, String url) {
    return ElevatedButton.icon(
      onPressed: () => _launchUrl(url),
      icon: FaIcon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'About Me'),
          const SizedBox(height: 16),
          Text(
            'I am Muhammad Ataur Rahman, MBA in marketing. '
                'Flutter Developer, passionate about building high-quality, scalable, '
                'ser-centric mobile applications. I specialize in Flutter, Dart, '
                'API integration, and modern UI development. I enjoy solving complex '
                'problems, exploring new technologies, and transforming innovative ideas '
                'into efficient digital solutions. My goal is to create efficient, beautiful '
                'and user-friendly applications that solve real-world problems.',
            style: TextStyle(
              fontSize: 16,
              height: 1.8,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Education'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildEducationCard(
                'MBA in Marketing ',
                'Stamford University Dhaka',
                '2005',
                'Private job. Focused on Software Development and Mobile Application Development.',
              ),
              _buildEducationCard(
                'Master in Management ',
                'National University Dhaka',
                'Passing Year: 2000',
                'Commerce  Background.',
              ),
              // _buildEducationCard(
              //   'SSC - Science',
              //   'Kalatia High School',
              //   'Passing Year: 2021',
              //   'Science Background.',
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(String title, String institution, String year, String description) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            institution,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            year,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    final technicalSkills = [
      'Flutter', 'Dart', 'API Integration',
      'Firebase', 'BloC', 'Git', 'GitHub', 'REST API',
      'Provider', 'GetX',
    ];

    final softSkills = [
      'Leadership', 'Problem Solving', 'Communication',
      'Teamwork', 'Time Management', 'Adaptability',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Technical Skills'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technicalSkills.map((skill) => SkillChip(label: skill)).toList(),
          ),
          const SizedBox(height: 32),
          const SectionTitle(title: 'Soft Skills'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: softSkills.map((skill) => SkillChip(label: skill, soft: true)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Experience'),
          const SizedBox(height: 16),
          ExperienceCard(
            title: 'App Development Intern',
            company: 'BLANK',
            period: '2026',
            description: 'Trying as an App Development Intern at X company. Developed Flutter applications and gained practical experience with Flutter, Dart, UI Design, API integration and mobile application development.',
            technologies: ['Flutter', 'Dart', 'Firebase', 'API Integration'],
            hasCertificate: true,
          ),
          const SizedBox(height: 16),
          ExperienceCard(
            title: 'Event management',
            company: 'Customer Award 2025',
            period: '4 Years',
            description: 'Organize successfully agent award ceremony for consecutive 3 years from 2022 to 2025.',
            technologies: ['Event management', 'Leadership'],
          ),
          const SizedBox(height: 16),
          // ExperienceCard(
          //   title: 'Leadership',
          //   company: 'Kalatia Anti-Discrimination Students and People',
          //   period: '',
          //   description: 'Leadership experience in teamwork, community activities and organizing programs.',
          //   technologies: ['Leadership', 'Team Management'],
          //   facebookPage: 'https://facebook.com/afahitech',
          // ),
        ],
      ),
    );
  }

  Widget _buildCertificatesSection(BuildContext context) {
    final certificates = [
      CertificateData(
        title: 'Will get Internship',
        subtitle: 'App Development Internship Offer Letter',
        icon: Icons.description,
        color: Colors.blue,
      ),
      CertificateData(
        title: 'Letter of Recommendation',
        subtitle: 'Recommendation Letter from X company',
        icon: Icons.recommend,
        color: Colors.green,
      ),
      CertificateData(
        title: 'App Development Internship',
        subtitle: 'X company App Development Internship Completion Certificate',
        icon: Icons.verified,
        color: Colors.orange,
      ),
      // CertificateData(
      //   title: 'SAM AI Technologies Internship',
      //   subtitle: 'Android App Development Internship Offer Letter',
      //   icon: Icons.phone_android,
      //   color: Colors.purple,
      // ),
      CertificateData(
        title: 'Agent_X',
        subtitle: 'AI & Technology Certificate',
        icon: Icons.auto_awesome,
        color: Colors.red,
      ),
      CertificateData(
        title: 'AI Prompt Engineering',
        subtitle: 'AI Prompt Related Certificate',
        icon: Icons.psychology,
        color: Colors.indigo,
      ),
      // CertificateData(
      //   title: 'BU CodeX',
      //   subtitle: 'Programming Competition Certificate',
      //   icon: Icons.code,
      //   color: Colors.teal,
      // ),
      // CertificateData(
      //   title: 'Cyber Security',
      //   subtitle: 'Cyber Security Training Certificate',
      //   icon: Icons.security,
      //   color: Colors.cyan,
      // ),
      CertificateData(
        title: 'Spoken English',
        subtitle: 'English Communication Certificate',
        icon: Icons.translate,
        color: Colors.amber,
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Certificates & Achievements'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: certificates.map((cert) => CertificateCard(data: cert)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    final projects = PortfolioData.projects;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Projects'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: projects.map((project) => ProjectCard(project: project)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(title: "Let's Talk 🚀"),
          const SizedBox(height: 8),
          Text(
            'Have a project idea or want to work together? Send me a message.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => _launchUrl('mailto:afahitech@gmail.com'),
              icon: const Icon(Icons.email),
              label: const Text('Send Message'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _buildContactChip(FontAwesomeIcons.github, 'GitHub', 'https://github.com/afahitech'),
              _buildContactChip(FontAwesomeIcons.linkedin, 'LinkedIn', 'https://linkedin.com/in/afahitech'),
              // _buildContactChip(FontAwesomeIcons.facebook, 'Facebook', 'https://facebook.com/afahitech'),
              // _buildContactChip(FontAwesomeIcons.twitter, 'Twitter', 'https://twitter.com/afahitech'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactChip(dynamic icon, String label, String url) {
    return ActionChip(
      avatar: FaIcon(icon, size: 16),
      label: Text(label),
      onPressed: () => _launchUrl(url),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
      ),
      child: Column(
        children: [

          Text(

            '© 2026 Muhammad Ataur Rahman. All rights reserved.',
            style: TextStyle(

              color: Colors.grey.shade400,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Built with Flutter ❤️',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Could not launch $url');
    }
  }
}