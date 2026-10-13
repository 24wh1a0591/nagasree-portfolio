import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

const Color bg = Color(0xFF090D18);
const Color panel = Color(0xFF121A2B);
const Color cyan = Color(0xFF67E8F9);
const Color purple = Color(0xFFA78BFA);
const Color muted = Color(0xFFADB8CC);

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lakshmi Naga Sree Potula | Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cyan,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final achievementsKey = GlobalKey();
  final educationKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final target = key.currentContext;

    if (target != null) {
      Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.05,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: -100,
            right: -100,
            child: Glow(color: purple),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                PortfolioNav(
                  onHome: () => scrollTo(homeKey),
                  onAbout: () => scrollTo(aboutKey),
                  onSkills: () => scrollTo(skillsKey),
                  onProjects: () => scrollTo(projectsKey),
                  onAchievements: () => scrollTo(achievementsKey),
                  onEducation: () => scrollTo(educationKey),
                  onContact: () => scrollTo(contactKey),
                ),
                Container(
                  key: homeKey,
                  child: HeroSection(
                    onProjects: () => scrollTo(projectsKey),
                    onContact: () => scrollTo(contactKey),
                  ),
                ),
                Container(
                  key: aboutKey,
                  child: const AboutSection(),
                ),
                Container(
                  key: skillsKey,
                  child: const SkillsSection(),
                ),
                Container(
                  key: projectsKey,
                  child: const ProjectsSection(),
                ),
                Container(
                  key: educationKey,
                  child: const EducationSection(),
                ),
                Container(
                  key: achievementsKey,
                  child: const AchievementsSection(),
                ),
                Container(
                  key: contactKey,
                  child: const ContactSection(),
                ),
                const FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Glow extends StatelessWidget {
  final Color color;

  const Glow({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.10),
              blurRadius: 150,
              spreadRadius: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class PortfolioNav extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onAchievements;
  final VoidCallback onEducation;
  final VoidCallback onContact;

  const PortfolioNav({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onAchievements,
    required this.onEducation,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18,
      ),
      decoration: const BoxDecoration(
        color: Color(0xEE090D18),
        border: Border(
          bottom: BorderSide(color: Colors.white10),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 680) {
                return Row(
                  children: [
                    const Text(
                      'LNS.',
                      style: TextStyle(
                        color: cyan,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Spacer(),
                    PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.menu,
                        color: cyan,
                      ),
                      onSelected: (value) {
                        if (value == 'Home') onHome();
                        if (value == 'About') onAbout();
                        if (value == 'Skills') onSkills();
                        if (value == 'Projects') onProjects();
                        if (value == 'Education') onEducation();

                        if (value == 'Achievements') {
                          onAchievements();
                        }

                        if (value == 'Contact') onContact();
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: 'Home',
                          child: Text('Home'),
                        ),
                        PopupMenuItem(
                          value: 'About',
                          child: Text('About'),
                        ),
                        PopupMenuItem(
                          value: 'Skills',
                          child: Text('Skills'),
                        ),
                        PopupMenuItem(
                          value: 'Projects',
                          child: Text('Projects'),
                        ),
                        PopupMenuItem(
                          value: 'Education',
                          child: Text('Education'),
                        ),
                        PopupMenuItem(
                          value: 'Achievements',
                          child: Text('Achievements'),
                        ),
                        PopupMenuItem(
                          value: 'Contact',
                          child: Text('Contact'),
                        ),
                      ],
                    ),
                  ],
                );
              }

              return Row(
                children: [
                  const Text(
                    'LNS.',
                    style: TextStyle(
                      color: cyan,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  NavButton('Home', onHome),
                  NavButton('About', onAbout),
                  NavButton('Skills', onSkills),
                  NavButton('Projects', onProjects),
                  NavButton('Education', onEducation),
                  NavButton('Achievements', onAchievements),
                  NavButton('Contact', onContact),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const NavButton(this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}

class PageWidth extends StatelessWidget {
  final Widget child;

  const PageWidth({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1150),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: child,
        ),
      ),
    );
  }
}
class HeroSection extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return PageWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 720;

            final intro = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.circle, color: cyan, size: 9),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'COMPUTER SCIENCE STUDENT',
                        style: TextStyle(
                          color: cyan,
                          fontSize: 12,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text(
                  "Hello, I'm",
                  style: TextStyle(color: muted, fontSize: 23),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lakshmi Naga\nSree Potula',
                  style: TextStyle(
                    fontSize: 46,
                    height: 1.15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 16),
                const GradientHeading(
                  text: 'Aspiring Software Developer',
                  size: 23,
                ),
                const SizedBox(height: 22),
                const Text(
                  'I am pursuing Computer Science and Engineering '
                  'and enjoy programming, problem solving, and '
                  'building practical technology solutions.',
                  style: TextStyle(
                    color: muted,
                    fontSize: 16,
                    height: 1.9,
                  ),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 14,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: onProjects,
                      icon: const Icon(
                        Icons.rocket_launch_outlined,
                      ),
                      label: const Text('View Projects'),
                      style: FilledButton.styleFrom(
                        backgroundColor: cyan,
                        foregroundColor: bg,
                        padding: const EdgeInsets.all(18),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: onContact,
                      icon: const Icon(Icons.mail_outline),
                      label: const Text('Contact Me'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: purple),
                        padding: const EdgeInsets.all(18),
                      ),
                    ),
                  ],
                ),
              ],
            );

            const profile = HeroProfile();

            if (isMobile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  intro,
                  const SizedBox(height: 40),
                  profile,
                ],
              );
            }

            return Row(
              children: [
                Expanded(flex: 6, child: intro),
                const SizedBox(width: 45),
                const Expanded(flex: 4, child: profile),
              ],
            );
          },
        ),
      ),
    );
  }
}

class GradientHeading extends StatelessWidget {
  final String text;
  final double size;

  const GradientHeading({
    super.key,
    required this.text,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [cyan, purple],
      ).createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class HeroProfile extends StatelessWidget {
  const HeroProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: cyan.withValues(alpha: 0.25),
        ),
        boxShadow: [
          BoxShadow(
            color: purple.withValues(alpha: 0.08),
            blurRadius: 45,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 125,
            height: 125,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [cyan, purple],
              ),
            ),
            padding: const EdgeInsets.all(4),
            child: const CircleAvatar(
              backgroundColor: panel,
              backgroundImage: const AssetImage('lib/assets/profile.jpg'),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Curious Mind. Creative Builder.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Learning, coding, and turning ideas into solutions.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: muted,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Expanded(
                child: Metric(
                  value: '8.55',
                  label: 'CGPA',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Metric(
                  value: '500+',
                  label: 'Problems solved',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class Metric extends StatelessWidget {
  final String value;
  final String label;

  const Metric({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: cyan,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: muted,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: const TextStyle(
            color: cyan,
            letterSpacing: 3,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: const TextStyle(
            color: muted,
            height: 1.8,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'A little about me',
              title: 'About Me',
              subtitle: 'My background and interests.',
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: panel,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: const Text(
                'I am pursuing a Bachelor of Technology in '
                'Computer Science and Engineering at BVRIT '
                'Hyderabad College of Engineering for Women. '
                'I enjoy developing programs, solving algorithmic '
                'challenges, and exploring computer vision. '
                'My projects and technical activities help me '
                'strengthen my programming, analytical thinking, '
                'communication, and teamwork skills.',
                style: TextStyle(
                  color: muted,
                  height: 2,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 22),
            const Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                Tag('Problem Solving'),
                Tag('Teamwork'),
                Tag('Analytical Thinking'),
                Tag('Communication'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;

  const Tag(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: cyan.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: cyan.withValues(alpha: 0.18),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: cyan,
          fontSize: 13,
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const groups = [
      {
        'title': 'Programming Languages',
        'icon': Icons.code,
        'skills': ['Java', 'Python', 'C', 'SQL'],
      },
      {
        'title': 'Web Technologies',
        'icon': Icons.web,
        'skills': ['HTML', 'CSS', 'JavaScript'],
      },
      {
        'title': 'Platforms & Tools',
        'icon': Icons.terminal,
        'skills': ['Windows', 'Linux', 'Git', 'VS Code'],
      },
      {
        'title': 'Coursework',
        'icon': Icons.school_outlined,
        'skills': ['OOP', 'DBMS', 'Operating Systems'],
      },
    ];

    return PageWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'My toolkit',
              title: 'Technical Skills',
              subtitle: 'Skills listed in my resume.',
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns =
                    constraints.maxWidth > 800 ? 2 : 1;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: groups.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    mainAxisExtent: 185,
                  ),
                  itemBuilder: (context, index) {
                    final group = groups[index];
                    final skillList =
                        group['skills'] as List<String>;

                    return Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: panel,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white10,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Icon(
                            group['icon'] as IconData,
                            color: cyan,
                            size: 28,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            group['title'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 13),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: skillList
                                .map((skill) => Tag(skill))
                                .toList(),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'What I have built',
              title: 'Featured Projects',
              subtitle: 'Selected projects from my resume.',
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns =
                    constraints.maxWidth > 800 ? 2 : 1;

                return GridView.count(
                  crossAxisCount: columns,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: columns == 2 ? 1.15 : 1.05,
                  children: const [
                    ProjectCard(
                      icon: Icons.remove_red_eye_outlined,
                      title:
                          'Driver Drowsiness Detection and Alert System',
                      year: '2026',
                      description:
                          'An AI-powered driver monitoring system '
                          'using computer vision. Facial landmarks '
                          'and Eye Aspect Ratio (EAR) are used to '
                          'monitor eye closure in real time.',
                      stack:
                          'Python • OpenCV • Dlib • NumPy • SciPy',
                    ),
                    ProjectCard(
                      icon: Icons.search_rounded,
                      title: 'Word Search Game',
                      year: '2025',
                      description:
                          'An interactive word search game with '
                          'word validation, score calculation, '
                          'and round tracking functionality.',
                      stack: 'Python',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String year;
  final String description;
  final String stack;

  const ProjectCard({
    super.key,
    required this.icon,
    required this.title,
    required this.year,
    required this.description,
    required this.stack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: cyan, size: 34),
              Text(
                year,
                style: const TextStyle(color: purple),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                color: muted,
                height: 1.8,
              ),
            ),
          ),
          const Divider(color: Colors.white12),
          Text(
            stack,
            style: const TextStyle(
              color: cyan,
              fontSize: 12,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'My academic journey',
              title: 'Education',
              subtitle:
                  'My academic background and performance.',
            ),
            const SizedBox(height: 30),
            const EducationCard(
              title:
                  'B.Tech in Computer Science and Engineering',
              institution:
                  'BVRIT Hyderabad College of Engineering for Women',
              duration: '2024–2028',
              result: 'CGPA: 8.55',
            ),
            const EducationCard(
              title: 'Intermediate (MPC)',
              institution:
                  'Narayana Junior College, Suchitra',
              duration: '2022–2024',
              result: 'Percentage: 97.6%',
            ),
            const EducationCard(
              title: 'Secondary School Certificate (SSC)',
              institution:
                  'Narayana Concept School, Alwal',
              duration: '2022',
              result: 'CGPA: 9.5/10',
            ),
          ],
        ),
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String title;
  final String institution;
  final String duration;
  final String result;

  const EducationCard({
    super.key,
    required this.title,
    required this.institution,
    required this.duration,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.school_outlined,
            color: cyan,
            size: 30,
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  institution,
                  style: const TextStyle(color: purple),
                ),
                const SizedBox(height: 8),
                Text(
                  '$duration  •  $result',
                  style: const TextStyle(color: muted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'Milestones',
              title: 'Achievements & Activities',
              subtitle: 'Experiences and events from my resume.',
            ),
            const SizedBox(height: 30),

            const AchievementCard(
              icon: Icons.workspace_premium_outlined,
              title: 'Top 2 — Zenaiz Data Engineering',
              subtitle: 'Zenaiz Data Engineering Internship Program',
              description:
                  'Secured a Top 2 position in the Zenaiz Data '
                  'Engineering Internship Program.',
            ),

            const AchievementCard(
              icon: Icons.code,
              title: '500+ Coding Problems',
              subtitle: 'Coding platforms',
              description:
                  'Strengthened logical thinking, algorithmic '
                  'skills, and problem-solving abilities.',
            ),

            const AchievementCard(
              icon: Icons.groups_outlined,
              title: 'Smart India Hackathon',
              subtitle: '2025',
              description:
                  'Collaborated on problem analysis, idea '
                  'generation, requirements, solution design, '
                  'and presentations.',
            ),

            const AchievementCard(
              icon: Icons.bug_report_outlined,
              title: 'Bug Bounty Coding Platform Event',
              subtitle: '2025',
              description:
                  'Participated in coding challenges and enhanced '
                  'debugging and problem-solving skills.',
            ),

            const AchievementCard(
              icon: Icons.lightbulb_outline,
              title: 'CBIT International Conference',
              subtitle: '2024',
              description:
                  'Gained exposure to emerging technologies, '
                  'research ideas, and technical innovations.',
            ),

            const SizedBox(height: 35),

            const SectionTitle(
              eyebrow: 'Continuous learning',
              title: 'Certifications',
              subtitle: 'Courses completed.',
            ),

            const SizedBox(height: 25),

            const AchievementCard(
              icon: Icons.workspace_premium_outlined,
              title: 'Front-End Web Development',
              subtitle: 'Infosys Springboard • 2026',
              description:
                  'Practical knowledge of HTML, CSS, and JavaScript.',
            ),

            const AchievementCard(
              icon: Icons.workspace_premium_outlined,
              title: 'Python Course for Beginners',
              subtitle: 'Scalar • 2025',
              description:
                  'Foundational Python programming concepts.',
            ),

            const AchievementCard(
              icon: Icons.workspace_premium_outlined,
              title: 'Python for Beginners',
              subtitle: 'Simplilearn • 2025',
              description:
                  'Python programming and problem-solving skills.',
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;

  const AchievementCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: cyan, size: 28),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: purple),
                ),
                const SizedBox(height: 9),
                Text(
                  description,
                  style: const TextStyle(
                    color: muted,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void showDetails(BuildContext context, String details) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(details),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWidth(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 60),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: purple.withValues(alpha: 0.35),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'GET IN TOUCH',
              style: TextStyle(
                color: cyan,
                letterSpacing: 3,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Let's Connect",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Interested in opportunities, collaboration, '
              'and building meaningful technology solutions.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: muted,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 28),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                ContactButton(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  onTap: () => showDetails(
                    context,
                    'nagasreepotula@gmail.com',
                  ),
                ),
                ContactButton(
                  icon: Icons.code,
                  label: 'GitHub',
                  onTap: () => showDetails(
                    context,
                    'github.com/24wh1a0591',
                  ),
                ),
                ContactButton(
                  icon: Icons.work_outline,
                  label: 'LinkedIn',
                  onTap: () => showDetails(
                    context,
                    'linkedin.com/in/'
                    'lakshmi-naga-sree-potula-778b70361',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ContactButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: cyan,
        side: const BorderSide(
          color: Colors.white24,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 17,
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white10,
          ),
        ),
      ),
      child: const Text(
        'Designed with Flutter & Dart • Lakshmi Naga Sree Potula',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white38,
          fontSize: 12,
        ),
      ),
    );
  }
}