import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: "Busca la comida",
      caption:
          "Ad tempor aute dolore exercitation. Velit exercitation consequat deserunt proident ipsum.",
      imageUrl: "assets/images/1.png"),
  SlideInfo(
      title: "Entrega rápida",
      caption:
          "Lorem voluptate exercitation aliquip in occaecat anim amet. Ex voluptate officia eu labore veniam excepteur dolor fugiat enim anim adipisicing anim.",
      imageUrl: "assets/images/2.png"),
  SlideInfo(
      title: "Disfruta la comida",
      caption:
          "Ullamco dolor elit magna cillum Lorem velit elit fugiat eiusmod in pariatur magna. Fugiat duis ipsum duis voluptate aute duis et reprehenderit pariatur dolore dolor.",
      imageUrl: "assets/images/3.png"),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = "tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('Salir')))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(
                title,
                style: titleStyle,
              ),
              const SizedBox(height: 10),
              Text(
                caption,
                style: captionStyle,
              ),
            ]),
      ),
    );
  }
}
