class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String projectUrl;
  final List<String> technologies;
  final String iosUrl;
  final String androidUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.projectUrl,
    required this.technologies,
    required this.iosUrl,
    required this.androidUrl,
  });
}

List<Project> myProjects = [
  Project(
    title: 'MoniMoore',
    description:
        'An application that offers a solution by providing an AI-powered personal finance management application that helps users to manage their finances.',
    imageUrl: 'assets/images/monimoore.png',
    projectUrl: 'https://monimoore.com/',
    technologies: [
      'Flutter',
      'Dart',
      'Firebase',
    ],
    iosUrl: "https://apps.apple.com/ng/app/monimoore/id6617758342",
    androidUrl:
        "https://play.google.com/store/apps/details?id=com.blockmoorehq.monimoore",
  ),
  Project(
    title: 'Kunda Kids',
    description:
        'A fun and educational storytelling app designed specifically for kids ages 3 to 8!',
    imageUrl: "assets/images/kundakids.png",
    projectUrl: 'https://kundakids.com',
    technologies: [
      'Flutter',
      'Dart',
      'Firebase',
      "Stripe",
      "Paystack",
      "Apple Pay",
      "Google Pay",
    ],
    iosUrl: "https://apps.apple.com/ng/app/kunda-kids/id1612794970",
    androidUrl:
        "https://play.google.com/store/apps/details?id=com.lhamycodes.kundakids",
  ),
  Project(
    title: 'MyCygnal',
    description:
        'An application that organizes all your health information in a clear dashboard and analyzes it.',
    imageUrl: "assets/images/mycygnal.png",
    projectUrl: 'https://mycygnal.com/',
    technologies: [
      'Flutter',
      'Dart',
      'Socket.io',
    ],
    iosUrl: "https://apps.apple.com/ng/app/mycygnal/id6502612399",
    androidUrl:
        "http://play.google.com/store/apps/details?id=com.mycygnal.mycygnal",
  ),
  Project(
    title: 'WealthSync',
    description:
        'A mobile app aimed to revolutionize financial planning experiences for users.',
    imageUrl: "assets/images/wealthsync.png",
    projectUrl: 'https://wealthsync.com.ng/',
    technologies: [
      'Flutter',
      'Dart',
      'Socket.io',
    ],
    iosUrl: "https://apps.apple.com/ng/app/wealthsync/id6692627014",
    androidUrl:
        "https://play.google.com/store/apps/details?id=com.smartstewards.wealthsync",
  ),
];