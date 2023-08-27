class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Hola!",
    image: "assets/images/image1.png",
    desc: "This is testing text for app.",
  ),
  OnboardingContents(
    title: "Welcome to MVVM Clean Arch",
    image: "assets/images/image2.png",
    desc: "Hope you will enjoy the learning.",
  ),
  OnboardingContents(
    title: "Demo App",
    image: "assets/images/image3.png",
    desc:
        "Good luck!.",
  ),
];
