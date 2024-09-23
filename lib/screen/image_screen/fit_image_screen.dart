import 'package:flutter/material.dart';

class FitImageScreen extends StatefulWidget {
  const FitImageScreen({super.key});

  @override
  State<FitImageScreen> createState() => _FitImageScreenState();
}

class _FitImageScreenState extends State<FitImageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(
          color: Colors.red,
        ),
        Text('BoxFit'),
        SizedBox(
          height: 16,
        ),
        ImageContainer(
          title: 'BoxFit.contain',
          boxFit: BoxFit.contain,
        ),
        ImageContainer(
          title: 'BoxFit.cover',
          boxFit: BoxFit.cover,
        ),
        ImageContainer(
          title: 'BoxFit.fill',
          boxFit: BoxFit.fill,
        ),
        ImageContainer(
          title: 'BoxFit.fitHeight',
          boxFit: BoxFit.fitHeight,
        ),
        ImageContainer(
          title: 'BoxFit.fitWidth',
          boxFit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String title;
  final BoxFit boxFit;

  const ImageContainer({super.key, required this.title, required this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Text(title),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: Image.network(
              'https://gratisography.com/wp-content/uploads/2024/03/gratisography-funflower-800x525.jpg',
              fit: boxFit,
            ),
          ),
        ],
      ),
    );
  }
}

class ClipperContainer extends StatefulWidget {
  const ClipperContainer({super.key});

  @override
  State<ClipperContainer> createState() => _ClipperContainerState();
}

class _ClipperContainerState extends State<ClipperContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipBehavior: Clip.hardEdge,
          clipper: TriangleClipper(),
          child: Container(
            color: Colors.red,
            width: 900.0,
            height: 900.0,
          ),
        ),
        ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: TriangleClipper(),
          child: Container(
            color: Colors.red,
            width: 900.0,
            height: 900.0,
          ),
        ),
        ClipPath(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          clipper: TriangleClipper(),
          child: Container(
            color: Colors.red,
            width: 900.0,
            height: 900.0,
          ),
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close;
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => true;
}
